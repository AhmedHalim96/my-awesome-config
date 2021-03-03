local awful = require("awful")

-- Default Apps
terminal="alacritty"
editor=os.getenv("EDITOR") or "codium"
browser="firefox"
filemanager="nemo"
terminalFM = "lf"

-- Startup Apps
startup_programs = {
  "picom-i",

  'remap', -- keyboard remaps

  'numlockx on', -- enable numlock

  "mintinstall-update-flatpak", -- Apply flatpak updates on startup

  'polkit', -- credential manager

  "albert",

  'touchpad-indicator',

  '/usr/bin/libinput-gestures',

  -- 'xiccd', -- Applies color profile

  --Systray
  'nm-applet --indicator', -- wifi
  'pnmixer', -- shows an audiocontrol applet in systray when installed.
  'blueberry-tray', -- Bluetooth tray icon
  'xfce4-power-manager', -- Power manager
  'flameshot',
  'copyq',
  'qbittorrent',
  'mintupdate-launcher',
  '"/opt/xdman/jre/bin/java" -Xmx1024m -jar "/opt/xdman/xdman.jar" -m', --Xtereme Download Manager

  'cryptomator %F',

  "onedrive --monitor", --OneDrive Sync


  -- Add applications that need to be killed between reloads
  -- to avoid multipled instances, inside the awspawn script
  '~/.config/awesome/modules/awspawn' -- Spawn "dirty" apps that can linger between sessions

}

-- global vars
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
altkey = "Mod1"
sloppy_focus_enabled = true

-- awful config
awful.util.terminal = terminal
awful.util.tagnames = { "1", "2", "3", "4", "5", "6", }

awful.layout.layouts = {
  awful.layout.suit.tile,   
  awful.layout.suit.max,
  awful.layout.suit.floating,
  awful.layout.suit.fair,
  awful.layout.suit.tile.bottom,
}

awful.mouse.snap.edge_enabled = false
