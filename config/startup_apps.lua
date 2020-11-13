local startup_apps = {
  "picom --config"..string.format("%s/.config/awesome/config/picom.conf", os.getenv("HOME")),
  "setxkbmap -layout 'us,ara' -option 'grp:alt_shift_toggle'",
  "setxkbmap -option terminate:ctrl_alt_bksp", --restart Xorg
  "mintinstall-update-flatpak", -- Apply flatpak updates on startup
  'nm-applet --indicator', -- wifi
  'pnmixer', -- shows an audiocontrol applet in systray when installed.
  'blueberry-tray', -- Bluetooth tray icon
  'numlockx on', -- enable numlock
  '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
  'xfce4-power-manager', -- Power manager
   'flameshot',
   "albert",
   "/usr/bin/caffeine",
    'touchpad-indicator',
    '/usr/bin/libinput-gestures',
    'mpd',
    'copyq',
    'xiccd', -- Applies color profile
   'nitrogen --restore',
   'qbittorrent',
   'cryptomator %F',
   'mintupdate-launcher',
   '"/opt/xdman/jre/bin/java" -Xmx1024m -jar "/opt/xdman/xdman.jar" -m', --Xtereme Download Manager

  -- Add applications that need to be killed between reloads
  -- to avoid multipled instances, inside the awspawn script
  '~/.config/awesome/modules/awspawn' -- Spawn "dirty" apps that can linger between sessions

}

return startup_apps