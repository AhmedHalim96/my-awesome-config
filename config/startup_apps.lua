startup_apps = {
  "picom --config '/home/ahmed/.config/awesome/config/picom.conf'",
  'nm-applet --indicator', -- wifi
  'pnmixer', -- shows an audiocontrol applet in systray when installed.
  'blueberry-tray', -- Bluetooth tray icon
  'numlockx on', -- enable numlock
  '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
  'xfce4-power-manager', -- Power manager
   'flameshot',
  --  'synology-drive -minimized',
  --  'steam -silent',
    'touchpad-indicator',
    'copyq',
  --  '/usr/bin/barrier',
   'nitrogen --restore',
   'qbittorrent',
   'mintupdate-launcher',
   'xdman',
  --  'guake',
  --  '~/.local/bin/wallpaper', -- wallpaper-reddit script
  -- Add applications that need to be killed between reloads
  -- to avoid multipled instances, inside the awspawn script
  '~/.config/awesome/config/awspawn' -- Spawn "dirty" apps that can linger between sessions

}

return startup_apps