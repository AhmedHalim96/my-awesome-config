-- Startup Apps
return {
    "xrandr --output eDP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --rate 180.00",
    "xrandr --output eDP-1 --set TearFree on",
    "xrandr --output HDMI-1-0 --set TearFree on",
    "xrdb -load ~/.config/X11/Xresources",
    "picom-i",
    "kb-startup-script",
    'polkit', -- Credential manager
    -- "albert",
    "kdeconnect-indicator",
    "breaktimer",
    'touchpad-indicator',
    'nm-applet --indicator', 
    'blueman-applet',
    'xfce4-power-manager',
    'flameshot',
    'copyq',
    'telegram',
    'qbittorrent',
    -- 'mintupdate-launcher',
    'udiskie -t -f nemo',
    'xbanish',
    'appimagelauncherd',
    --Xtereme Download Manager
    -- '"/opt/xdman/jre/bin/java" -Xmx1024m -jar "/opt/xdman/xdman.jar" -m', 
    "xdman",
    "arander",
    "redshift-location-1", -- Redshift
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/modules/awspawn' -- Spawn "dirty" apps that can linger between sessions
    
}
