-- HYDRA
-- Loading modules
require "grid"
hydra.douserfile("menuconfig")

-- Loading of the config
hydra.alert("Hydra config loaded", 1)

-- watch ~/.hydra
pathwatcher.new(os.getenv("HOME") .. "/.hydra/", hydra.reload):start()

-- launch at login
autolaunch.set(true)

-- hotkeys
local cmdalt = {"cmd", "alt"}
local ctrlaltcmd = {"ctrl", "alt", "cmd"}
local alt = {"alt"}
local cmd = {"cmd"}

-- moving
-- sides
hotkey.bind(cmdalt, "LEFT", ext.grid.movewindow_leftside)
hotkey.bind(cmdalt, "RIGHT", ext.grid.movewindow_rightside)
hotkey.bind(cmdalt, "UP", ext.grid.movewindow_upperside)
hotkey.bind(cmdalt, "DOWN", ext.grid.movewindow_bottomside)

-- maximizing
hotkey.bind(cmdalt, 'F', ext.grid.maximize_window)

-- resizing
hotkey.bind(alt, "LEFT", ext.grid.resizewindow_thinner);
hotkey.bind(alt, "RIGHT", ext.grid.resizewindow_wider);
hotkey.bind(alt, "UP", ext.grid.resizewindow_smaller);
hotkey.bind(alt, "DOWN", ext.grid.resizewindow_taller);

-- focusing
hotkey.bind(ctrlaltcmd, 'H', function() window.focusedwindow():focuswindow_west() end)
hotkey.bind(ctrlaltcmd, 'L', function() window.focusedwindow():focuswindow_east() end)
hotkey.bind(ctrlaltcmd, 'K', function() window.focusedwindow():focuswindow_north() end)
hotkey.bind(ctrlaltcmd, 'J', function() window.focusedwindow():focuswindow_south() end)

-- repl
hotkey.bind(ctrlaltcmd, 'R', function() repl.open() end)

