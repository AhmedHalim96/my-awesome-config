local awful = require("awful")

-- Default Apps
terminal="alacritty"
editor=os.getenv("EDITOR") or "codium"
browser="firefox"
filemanager="nemo"
terminalFM = "lf"


-- global vars
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
altkey = "Mod1"
sloppy_focus_enabled = true

-- awful config
awful.util.terminal = terminal
awful.util.tagnames = { "1", "2", "3", "4", "5", "6"}

awful.layout.layouts = {
  awful.layout.suit.tile,   
  awful.layout.suit.max,
  awful.layout.suit.fair,
  awful.layout.suit.floating,
}

