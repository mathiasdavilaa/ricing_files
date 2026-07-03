--------------
---- APPS ----
--------------

local terminal = "kitty"
local browser = "zen-browser"
local files = "nautilus" --"kitty yazi"
local message = "zapzap"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "ALT"
local mainSuper = "SUPER"

hl.bind(mainSuper .. " + CTRL + E",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

--------------
---- APPS ----
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainSuper .. " + S", hl.dsp.exec_cmd(browser))
hl.bind(mainSuper .. " + A", hl.dsp.exec_cmd(files))
hl.bind(mainSuper .. " + Z", hl.dsp.exec_cmd(message))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("pkill localsend || localsend"), { repeating = false })

----------------
---- WINDOW ----
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })) --maximaze
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })) --fullscreen
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" })) --toggle floating
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }) --drag window
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) --resize window
hl.bind(mainMod .. " + W", hl.dsp.window.close(), { repeating = true }) -- close window
hl.bind(mainMod .. " + tab", hl.dsp.window.cycle_next(), { repeating = true }) --cycle through windows
hl.bind(mainMod .. " + Backslash", function() --change layout
    local currentLayout = hl.get_config("general.layout")
    local newLayout, icon, color
    if currentLayout == "dwindle" then
        newLayout = "scrolling"
        color = "rgb(89b4fa)" -- azulv
    else
        newLayout = "dwindle"
        color = "rgb(a6e3a1)" -- verde
    end
    hl.config({ general = { layout = newLayout } })
    hl.notification.create({text = "Layout: " .. newLayout, timeout = 2500, icon = icon, color = color, font_size = 16})
end)
hl.bind(mainMod .. " + minus", hl.dsp.layout("colresize -0.1")) --more size window
hl.bind(mainMod .. " + equal", hl.dsp.layout("colresize +0.1")) --less size window

------------------
---- OVERVIEW ----
hl.bind(mainMod .. "+ Grave", function()
    hl.plugin.scrolloverview.overview("toggle")
end)

--------------------
---- SPECIAL WS ----
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic")) --special ws
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" })) --send to special ws

--------------------
---- WORKSPACES ----
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" })) --focus left
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" })) --focus right
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" })) --focus left
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" })) --focus up
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" })) --focus down
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" })) --focus right
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" })) --move left
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" })) --move up
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" })) --move down
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" })) --move right
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" })) --move left
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" })) --move up
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" })) --move down
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" })) --move right
hl.bind(mainMod .. " + Down", hl.dsp.focus({ workspace = "e+1" })) --change to next ws
hl.bind(mainMod .. " + Up", hl.dsp.focus({ workspace = "e-1" })) --change to previous ws
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-------------------
---- SCROLLING ----
hl.bind(mainMod .. " + comma", hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + period", hl.dsp.layout("consume_or_expel next"))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.layout("expel"))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("consume"))

---------------
---- MEDIA ----
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl --class=backlight set +5%"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl --class=backlight set 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

---------------------
---- PRINTSCREEN ----
-- Captura a tela inteira, copia para o clipboard e salva na pasta Imagens
hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy && grim ~/Imagens/Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"), 
    { locked = true })

-- Permite selecionar uma área com o mouse, copia e salva na pasta Imagens
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy && grim -g \"$(slurp)\" ~/Imagens/Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"), 
    { locked = true })

--[[ 
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 10%+ && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%- && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = false })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = false })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), { locked = true, repeating = true })

hl.bind("ALT + BracketRight",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 10%+ && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"),
    { locked = true, repeating = true })
hl.bind("ALT + BracketLeft",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%- && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"),
    { locked = true, repeating = true })
hl.bind("ALT + slash", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = false })
--hl.bind("ALT + backslash", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
--    { locked = true, repeating = false })
hl.bind("ALT + apostrophe", hl.dsp.exec_cmd("brightnessctl set 10%+"), { locked = true, repeating = true })
hl.bind("ALT + semicolon", hl.dsp.exec_cmd("brightnessctl set 10%-"), { locked = true, repeating = true })

hl.bind("ALT + Period", hl.dsp.exec_cmd(" bash ~/.config/Scripts/full_screenshot.sh"),
    { locked = true, repeating = false })
hl.bind("ALT + Comma", hl.dsp.exec_cmd(" bash ~/.config/Scripts/partial_screenshot.sh"),
    { locked = true, repeating = false })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("ALT + V", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("ALT + C", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("ALT + x", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("ALT + B", hl.dsp.exec_cmd("playerctl position 1+"), { locked = true, repeating = true })
hl.bind("ALT + Z", hl.dsp.exec_cmd("playerctl position 1-"), { locked = true, repeating = true }) 
]]