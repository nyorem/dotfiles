ext.grid = {}

-- constants:
-- width and height of the grid
ext.grid.GRIDWIDTH = 5
ext.grid.GRIDHEIGHT = 5;

-- increments used during resizing
ext.grid.INCRX = 1;
ext.grid.INCRY = 1;

-- helpers
-- round
local function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- get
function ext.grid.get(win)
  local winframe = win:frame()
  local screenrect = win:screen():frame_without_dock_or_menu()
  local thirdscreenwidth = screenrect.w / ext.grid.GRIDWIDTH
  local halfscreenheight = screenrect.h / ext.grid.GRIDHEIGHT
  return {
    x = round((winframe.x - screenrect.x) / thirdscreenwidth),
    y = round((winframe.y - screenrect.y) / halfscreenheight),
    w = math.max(1, round(winframe.w / thirdscreenwidth)),
    h = math.max(1, round(winframe.h / halfscreenheight)),
  }
end

-- set
function ext.grid.set(win, grid, screen)
  local screenrect = screen:frame_without_dock_or_menu()
  local thirdscreenwidth = screenrect.w / ext.grid.GRIDWIDTH
  local halfscreenheight = screenrect.h / ext.grid.GRIDHEIGHT
  local newframe = {
    x = (grid.x * thirdscreenwidth) + screenrect.x,
    y = (grid.y * halfscreenheight) + screenrect.y,
    w = grid.w * thirdscreenwidth,
    h = grid.h * halfscreenheight,
  }

  newframe.x = newframe.x
  newframe.y = newframe.y
  newframe.w = newframe.w
  newframe.h = newframe.h

  win:setframe(newframe)
end

function ext.grid.adjust_focused_window(fn)
  local win = window.focusedwindow()
  local f = ext.grid.get(win)
  fn(f)
  ext.grid.set(win, f, win:screen())
end

-- maximize
function ext.grid.maximize_window()
  local win = window.focusedwindow()
  local f = {x = 0, y = 0, w = ext.grid.GRIDWIDTH, h = ext.grid.GRIDHEIGHT}
  ext.grid.set(win, f, win:screen())
end

-- moving
-- left side
function ext.grid.movewindow_leftside()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  win:setframe(newframe)
end

-- right side
function ext.grid.movewindow_rightside()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  newframe.x = newframe.w
  win:setframe(newframe)
end

-- upper side
function ext.grid.movewindow_upperside()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  win:setframe(newframe)
end

-- bottom side
function ext.grid.movewindow_bottomside()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  newframe.y = newframe.h;
  win:setframe(newframe)
end

-- top left
function ext.grid.movewindow_topleft()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2;
  newframe.w = newframe.w / 2;
  win:setframe(newframe)
end

-- bottom left
function ext.grid.movewindow_bottomleft()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2;
  newframe.w = newframe.w / 2;
  newframe.y = newframe.h;
  win:setframe(newframe)
end

-- top right
function ext.grid.movewindow_topright()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2;
  newframe.w = newframe.w / 2;
  newframe.x = newframe.w;
  win:setframe(newframe)
end

-- bottom right
function ext.grid.movewindow_bottomright()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2;
  newframe.w = newframe.w / 2;
  newframe.x = newframe.w;
  newframe.y = newframe.h;
  win:setframe(newframe)
end

-- resizing
function ext.grid.resizewindow_wider()
  ext.grid.adjust_focused_window(function(f) f.w = f.w + ext.grid.INCRX end)
end

function ext.grid.resizewindow_thinner()
  ext.grid.adjust_focused_window(function(f) f.w = f.w - ext.grid.INCRX end)
end

function ext.grid.resizewindow_taller()
  ext.grid.adjust_focused_window(function(f) f.h = f.h + ext.grid.INCRY end)
end

function ext.grid.resizewindow_smaller()
  ext.grid.adjust_focused_window(function(f) f.h = f.h - ext.grid.INCRY end)
end

