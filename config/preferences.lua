local awful = require("awful")

-- Default Apps
terminal = os.getenv('TERMINAL') or 'alacritty'
editor = os.getenv("EDITOR") or "codium" 
browser = os.getenv("BROWSER") or 'brave-browser  --profile-directory="Default"'
filemanager="nemo"
terminalFM = "lf"


-- global vars
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
altkey = "Mod1"
sloppy_focus_enabled = true

-- awful config
awful.util.terminal = terminal
awful.util.tagnames = { "1", "2", "3", "4", "5", "6", "7", "8", "9"}

awful.layout.layouts = {
  awful.layout.suit.tile,   
  awful.layout.suit.max,
  awful.layout.suit.fair,
  awful.layout.suit.floating,
}

