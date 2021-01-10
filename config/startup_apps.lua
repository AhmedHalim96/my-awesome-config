local startup_apps = {
  "picom-i",

  'remap', -- keyboard remaps

  'numlockx on', -- enable numlock
  "randbg",

  "mintinstall-update-flatpak", -- Apply flatpak updates on startup

  '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager

  "albert",

  'touchpad-indicator',

  '/usr/bin/libinput-gestures',

  'xiccd', -- Applies color profile


  

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

return startup_apps
