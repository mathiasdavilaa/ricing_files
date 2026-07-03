--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.workspace_rule({ workspace = "i", layout = "scrolling" })
--hl.workspace_rule({ workspace = "3", layout = "dwindle" })

hl.window_rule({
  name   = "float-file-pickers",
  match  = { title = "^(Open File|Open Folder|Open|Save|Save As|Export|Import|Choose File|Rename)$" },
  float  = true,
  center = true,
  decorate = false
})

hl.layer_rule({
  name  = "Essential blur",
  match = { namespace = "logout_dialog|rofi|quickshell" },
  blur = true,
  ignore_alpha = 0,
})

hl.window_rule({
  name  = "Cava window rule",
  match = { class = "cava" },
  float = true,
  no_blur = true,
  rounding = 0,
  border_size = 0,
  no_initial_focus = true,
  move = {6,888},
  opacity = "1.0",
  pin = true,
  size = {"(monitor_w*1.00)","(monitor_h*0.18)"},
})

local suppressMaximizeRule = hl.window_rule({
  name  = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name  = "Floating windows",
  match = { class = "sensors|bluetui|thunar|nwg-look|org.kde.kdeconnect.sms|aichat|nmtui|battery|pulsemixer|org.gnome.Nautilus|org.kde.kdeconnect.app|localsend" },
  float = true,
  no_initial_focus = false,
  border_size = 2,
  move = {960,510},
  opacity = "1.0",
  pin = true,
  decorate = false,
  size = {"(monitor_w*0.48)","(monitor_h*0.50)"},
})
