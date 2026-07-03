local mainMod = "SUPER"

hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("/usr/bin/quickshell ipc -p /usr/share/tide-island call overview toggle"))
hl.bind(mainMod .. " + right", hl.dsp.exec_cmd("/usr/bin/quickshell ipc -p /usr/share/tide-island call tide showLyrics"))
hl.bind(mainMod .. " + left", hl.dsp.exec_cmd("/usr/bin/quickshell ipc -p /usr/share/tide-island call tide showCustom"))
hl.bind(mainMod .. " + down", hl.dsp.exec_cmd("/usr/bin/quickshell ipc -p /usr/share/tide-island call tide showClock"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("/usr/bin/quickshell ipc -p /usr/share/tide-island call tide togglePlayer"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("/usr/bin/quickshell ipc -p /usr/share/tide-island call tide toggleControlCenter"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("/usr/bin/quickshell ipc -p /usr/share/tide-island call tide toggleWallpaperPicker"))