-- Startup Apps
return {
    "picom-i",
    'remap', 
    'numlockx on',
    -- Apply flatpak updates on startup
    "mintinstall-update-flatpak",
    -- Credential manager
    'polkit', 
    "albert",
    -- "plank",
    'touchpad-indicator',
    '/usr/bin/libinput-gestures',
    -- wifi
    'nm-applet --indicator', 
    -- 'pnmixer',
    'blueberry-tray', 
    'xfce4-power-manager',
    'flameshot',
    'copyq',
    'qbittorrent',
    'mintupdate-launcher',
    'udiskie -t -f nemo',
    'xbanish',
    --Xtereme Download Manager
    '"/opt/xdman/jre/bin/java" -Xmx1024m -jar "/opt/xdman/xdman.jar" -m', 
    -- 'cryptomator %F',
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/modules/awspawn' -- Spawn "dirty" apps that can linger between sessions
}
