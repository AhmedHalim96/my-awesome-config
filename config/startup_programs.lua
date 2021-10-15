-- Startup Apps
return {
    "picom-i",
    "xrdb -load ~/.config/X11/Xresources",
    "kb-startup-script",
    --"mintinstall-update-flatpak", -- Apply flatpak updates on startup -- removed in mint 20.2
    'polkit', -- Credential manager
    "albert",
    "breaktimer",
    'touchpad-indicator',
    '/usr/bin/libinput-gestures',
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
    'appimagelauncherd',
    --Xtereme Download Manager
    '"/opt/xdman/jre/bin/java" -Xmx1024m -jar "/opt/xdman/xdman.jar" -m', 
    -- 'cryptomator %F',
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/modules/awspawn' -- Spawn "dirty" apps that can linger between sessions
}
