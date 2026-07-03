local mainMod = "SUPER"

local INTERNAL = "eDP-1"
local EXTERNAL = "HDMI-A-1"

local function external_connected()
    return hl.get_monitor(EXTERNAL) ~= nil
end

local function on_ac()
    local f = io.open("/sys/class/power_supply/AC/online", "r")
    if f == nil then
        f = io.open("/sys/class/power_supply/AC0/online", "r")
    end
    if f == nil then return false end
    local val = f:read("*n")
    f:close()
    return val == 1
end

local function disable_internal()
    hl.monitor({ output = INTERNAL, disabled = true })
end

local function enable_internal()
    hl.monitor({ output = INTERNAL, disabled = false })
end

function clamshell_toggle()
    if hl.get_monitor(INTERNAL) ~= nil then
        disable_internal()
    else
        enable_internal()
    end
end

hl.on("hyprland.start", function()
    if not external_connected() then
        enable_internal()
    end
end)

hl.bind(mainMod .. " + Backslash", clamshell_toggle)
