-- Startup Apps
return {
    "xrandr --output eDP --set TearFree on",
    "xrdb -load ~/.config/X11/Xresources",
    "picom-i",
    "kb-startup-script",
    'polkit', -- Credential manager
    -- "albert",
    "breaktimer",
    'touchpad-indicator',
    'nm-applet --indicator', 
    'blueman-applet',
    'xfce4-power-manager',
    'flameshot',
    'copyq',
    'qbittorrent',
    -- 'mintupdate-launcher',
    'udiskie -t -f nemo',
    'xbanish',
    'appimagelauncherd',
    --Xtereme Download Manager
    '"/opt/xdman/jre/bin/java" -Xmx1024m -jar "/opt/xdman/xdman.jar" -m', 
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/modules/awspawn' -- Spawn "dirty" apps that can linger between sessions
}
