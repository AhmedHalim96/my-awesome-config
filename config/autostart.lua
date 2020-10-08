apps = {
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
   'xdman',
  --  'guake',
  --  '~/.local/bin/wallpaper', -- wallpaper-reddit script
  -- Add applications that need to be killed between reloads
  -- to avoid multipled instances, inside the awspawn script
  '~/.config/awesome/config/awspawn' -- Spawn "dirty" apps that can linger between sessions

}

local awful = require('awful')

local function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then
    findme = cmd:sub(0, firstspace - 1)
  end
  awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd))
end

for _, app in ipairs(apps) do
  run_once(app)
end
