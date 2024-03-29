local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local naughty = require("naughty")
local scratch = require("modules.scratch")
local HOME    = os.getenv("HOME")



local globalkeys = gears.table.join(
  awful.key(
    { modkey,}, "F1",
    hotkeys_popup.show_help,
    {description="show help", group="awesome"}
  ),
  
  -- Workspace shortcut
  awful.key(
    {modkey},
    'Tab',
    revelation,
    {description = 'Switch to next window', group = 'client'}
  ),
  awful.key(
    { altkey, 'Control'}, "h",   
    awful.tag.viewprev,
    {description = "view previous", group = "tag"}
  ),
      
  awful.key(
    { altkey, 'Control'}, "l",  
    awful.tag.viewnext,
    {description = "view next", group = "tag"}
  ),

  awful.key({ modkey,   }, "d",      
  function ()
    local minimize = false

    if mouse.screen.selected_tag then
      for _, cl in ipairs(mouse.screen.selected_tag:clients()) do
        local c = cl
        if c then
          if c.minimized==false then
            minimize = true
          end
        end
      end
  
      for _, cl in ipairs(mouse.screen.selected_tag:clients()) do
  
        local c = cl
        if c then
          c.minimized = minimize
        end
      end
    end
  end,
  {description = "(un)minimize all windows in current tag", group = "client"}),

  awful.key(
    { modkey,}, "u", 
    awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}
  ),

  awful.key(
  {altkey},
  '`',
  function()
    awful.client.focus.history.previous()
    if _G.client.focus then
      _G.client.focus:raise()
    end
  end,
  {description = 'Switch to previous window', group = 'client'}
  ),

  awful.key(
    {altkey},
    'Tab',
    function()
      -- awful.client.focus.history.previous()
      awful.client.focus.byidx(1)
      if _G.client.focus then
      _G.client.focus:raise()
      end
    end,
    {description = 'Switch to next window', group = 'client'}
  ),

  awful.key(
    {altkey, 'Shift'},
    'Tab',
    function()
      --awful.client.focus.history.previous()
      awful.client.focus.byidx(-1)
      if _G.client.focus then
        _G.client.focus:raise()
      end
    end,
    {description = 'Switch to previous window', group = 'client'}
  ),



  --########################################################
  --## Programs
  --########################################################

  awful.key(
    {modkey},
    's',
    function()
      awful.spawn('smplayer')
    end,
    {description = 'Smplayer', group = 'Programs'}
  ),

  awful.key(
    {modkey},
    'c',
    function()
      awful.spawn('copyq toggle')
    end,
    {description = 'copyq', group = 'Programs'}
  ),

  awful.key(
    {modkey},
    'XF86AudioPlay',
    function()
      awful.spawn(terminal ..' --class ncmpcpp -e ncmpcpp')
    end,
    {description = 'ncmp-worst-name-ever', group = 'Programs'}
  ),

  awful.key(
    { modkey,}, "Return", 
    function () awful.spawn(terminal) end,
    {description = "open a terminal", group = "Programs"}
  ),

  awful.key(
    { modkey,}, "b", 
    function () awful.spawn(browser) end,
    {description = "open default browser", group = "Programs"}
  ),

  awful.key(
    { modkey, "Shift"}, "e", 
    function () awful.spawn("lf_fm") end,
    {description = "open lf", group = "Programs"}
  ),
  
  awful.key(
    { modkey,}, "e", 
    function () awful.spawn(filemanager) end,
    {description = "open default filemanager", group = "Programs"}
  ),

  awful.key(
    { modkey,}, "Escape", 
    function () awful.spawn('system-monitoring-center') end,
    {description = "open system monitor", group = "Programs"}
  ),
  
  awful.key(
    { modkey,}, "z",
    function () scratch.toggle("alacritty --class scratch", { instance = "scratch" })  end,
    {description = "Open ScratchPad Terminal", group = "Programs"}
  ),

  awful.key(
    { modkey, "Shift"}, "g", 
    function () awful.spawn('lutris') end,
    {description = "open Lutris", group = "Programs"}
  ),

  awful.key(
    { modkey, "Shift"}, ".", 
    function () awful.spawn('code ' .. HOME .. '/.config/awesome') end,
    {description = "Open Awesome Config", group = "Programs"}
  ),

  awful.key(
    { modkey }, ".", 
    function () awful.spawn('dmconf') end,
    {description = "dmconf", group = "Programs"}
  ),

  -- dmenu Run Prompt
  awful.key(
    { modkey },"r",
    function () awful.spawn('dmenu_run_history -f -i -p "Run: "') end,
    {description = "run prompt", group = "Programs"}
  ),

  -- Flamshot 
  awful.key(
    {""}, "Print", 
    function () awful.spawn('flameshot gui  -p '..HOME..'/Pictures/Screenshots') end,
    {description = "flameshot gui", group = "Flamshot"}
  ),

  awful.key(
    {"Control"}, "Print", 
    function () awful.spawn('flameshot gui -d 2000  -p '..HOME..'/Pictures/Screenshots') end,
    {description = "delayed flameshot gui", group = "Flamshot"}
  ),
  
  awful.key(
    {modkey}, "Print", 
    function () awful.spawn('flameshot full -p '..HOME..'/Pictures/Screenshots') end,
    {description = "flameshot gui", group = "Flamshot"}
  ),

  -- emojii
  awful.key(
    {modkey, 'Shift'}, ";", 
    function () awful.spawn("emoji-picker") end,
    {description = "Opens emoji picker", group = "Programs"}
  ),

-- Network Manager dmenu 
  awful.key(
    {modkey}, "y", 
    function () awful.spawn("networkmanager_dmenu") end,
    {description = "Opens Network Manager dmenu", group = "Programs"}
  ),

  -- MPD
  awful.key(
    {"Control"},
    'XF86AudioNext',
    function()
      awful.spawn('playerctl next -p mpd')
    end,
    {description = 'Next', group = 'mpd'}
  ),
  awful.key(
    {"Control"},
    'XF86AudioPrev',
    function()
      awful.spawn('playerctl previous -p mpd')
    end,
    {description = 'Previous', group = 'mpd'}
  ),
  awful.key(
    {"Control"},
    'XF86AudioPlay',
    function()
      awful.spawn('playerctl play-pause -p mpd')
    end,
    {description = 'Play-Pause', group = 'mpd'}
  ),

  awful.key(
    {modkey, 'Control'},
    '.',
    function()
      awful.spawn('mpc seek +00:00:10')
    end,
    {description = 'seek +10 seconds', group = 'mpd'}
  ),

  awful.key(
    {modkey, 'Control'},
    ',',
    function()
      awful.spawn('mpc seek -00:00:10')
    end,
    {description = 'seek -10 seconds', group = 'mpd'}
  ),

  awful.key(
    {modkey, 'Control'},
    'backspace',
    function()
      awful.spawn('mpc seek 0')
    end,
    {description = 'Rewind Current track', group = 'mpd'}
  ),

  awful.key(
    {modkey},
    '\\',
    function()
      awful.spawn('picom-r')
    end,
    {description = 'Restart picom', group = 'Programs'}
  ),

  awful.key(
    { modkey }, "p", 
    -- function() menubar.show() end,
    -- {description = "show the menubar", group = "Programs"}

    function() awful.spawn('albert toggle') end,
    {description = "toggle albert", group = "Programs"}
  ),

  awful.key(
		{modkey, "Shift"},
		'x',
		function()
			awful.spawn('xkill')
		end,
		{description = 'xkill', group = 'Custom'}
	),

    --########################################################
  --## Awesome Control 
  --########################################################

  awful.key(
    { modkey, "Control" }, "r", 
    awesome.restart,
    {description = "reload awesome", group = "awesome"}
  ),

  awful.key(
    { modkey, "Shift"}, "q", 
    awesome.quit,
    {description = "quit awesome", group = "awesome"}
  ),

  awful.key(
    {modkey}, "l",     
    function () awful.tag.incmwfact( 0.05)          end,
    {description = "increase master width factor", group = "layout"}
  ),

  awful.key(
    {modkey}, "h",     
    function () awful.tag.incmwfact(-0.05)          end,
    {description = "decrease master width factor", group = "layout"}
  ),
  awful.key(
    {modkey},
    'j',
    function()
      awful.client.incwfact(-0.05)
    end,
    {description = 'decrease master height factor', group = 'layout'}
  ),
  awful.key(
    {modkey},
    'k',
    function()
      awful.client.incwfact(0.05)
    end,
    {description = 'increase master height factor', group = 'layout'}
  ),

  awful.key(
    { modkey, "Control"   }, "l",     
    function () awful.tag.incnmaster( 1, nil, true) end,
    {description = "increase the number of master clients", group = "layout"}
  ),

  awful.key(
    { modkey, "Control"   }, "h",     
    function () awful.tag.incnmaster(-1, nil, true) end,
    {description = "decrease the number of master clients", group = "layout"}
  ),

  awful.key(
    { modkey, "Control" }, "k",     
    function () awful.tag.incncol( 1, nil, true)    end,
    {description = "increase the number of columns", group = "layout"}
  ),

  awful.key(
    { modkey, "Control" }, "j",     
    function () awful.tag.incncol(-1, nil, true)    end,
    {description = "decrease the number of columns", group = "layout"}
  ),

  awful.key(
    { modkey,}, "space", 
    function () awful.layout.inc( 1)                end,
    {description = "select next", group = "layout"}
  ),

  awful.key(
    { modkey, "Shift"   }, "space", 
    function () awful.layout.inc(-1)                end,
    {description = "select previous", group = "layout"}
  ),

  awful.key(
    { modkey,"Shift"   }, "h", 
    function () awful.client.swap.bydirection ('left')              end,
    {description = "Move to the left", group = "layout"}
  ),

  awful.key(
    { modkey,"Shift"   }, "l", 
    function () awful.client.swap.bydirection ('right')              end,
    {description = "Move to the right", group = "layout"}
  ),
  
  awful.key(
    { modkey,"Shift"   }, "k", 
    function () awful.client.swap.bydirection ('up')              end,
    {description = "Move up", group = "layout"}
  ),
  
  awful.key(
    { modkey,"Shift"   }, "j", 
    function () awful.client.swap.bydirection ('down')              end,
    {description = "Move down", group = "layout"}
  ),

  -- awful.key(
  -- 	{ modkey, "Shift"}, "f", 
  -- 	function () awful.layout.set(awful.layout.suit.tile.left)                end,
  -- 	{description = "flip layout", group = "layout"}
  -- ),

  awful.key(
    { modkey, "Control" }, "n",
      function ()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
          c:emit_signal(
            "request::activate", "key.unminimize", {raise = true}
          )
        end
      end,
      {description = "restore minimized", group = "client"}
    ),

  -- Brightness
  awful.key(
    {},
    'XF86MonBrightnessUp',
    function()
      -- awful.spawn('xbacklight -inc 10')
      -- awful.spawn('light -A 10')
      brightness_widget:inc()


    end,
    {description = 'Brightness +10%', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86MonBrightnessDown',
    function()
      -- awful.spawn('xbacklight -dec 10')
      -- awful.spawn('light -U 10')
      brightness_widget:dec()
    end,
    {description = 'Brightness -10%', group = 'hotkeys'}
  ),
  awful.key(
    {modkey, "Control"},
    'Right',
    function()
      -- awful.spawn('xbacklight -inc 10')
      -- awful.spawn('light -A 10')
      brightness_widget:inc()


    end,
    {description = 'Brightness +10%', group = 'hotkeys'}
  ),

  awful.key(
    {modkey, "Control"},
    'Left',
    function()
      -- awful.spawn('xbacklight -dec 10')
      -- awful.spawn('light -U 10')
      brightness_widget:dec()
    end,
    {description = 'Brightness -10%', group = 'hotkeys'}
  ),

  -- Multimedia 
  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function()
      volumecfg:up()
    end,
    {description = 'volume up', group = 'Multimedia'}
  ),

  awful.key(
    {},
    'XF86AudioLowerVolume',
    function()
      volumecfg:down()
    end,
    {description = 'volume down', group = 'Multimedia'}
  ),

  awful.key(
    {modkey, "Control"},
    'Up',
    function()
      awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%")
    end,
    {description = 'Boooost volume up', group = 'Multimedia'}
  ),
  
  awful.key(
    {modkey, "Control"},
    'Down',
    function()
      awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%")
    end,
    {description = 'Boooost volume down', group = 'Multimedia'}
  ),

  awful.key(
    {},
    'XF86AudioMute',
    function()
      volumecfg:toggle()
    end,
    {description = 'toggle mute', group = 'Multimedia'}
  ),

  awful.key(
    {},
    'XF86AudioNext',
    function()
      awful.spawn('playerctl next')
    end,
    {description = 'Next', group = 'Multimedia'}
  ),
  
  awful.key(
    {},
    'XF86AudioPrev',
    function()
      awful.spawn('playerctl previous')
    end,
    {description = 'Previous', group = 'Multimedia'}
  ),

  awful.key(
    {},
    'XF86AudioPlay',
    function()
      awful.spawn('playerctl play-pause')
    end,
    {description = 'Play-Pause', group = 'Multimedia'}
  ),

  awful.key(
    {},
    'XF86PowerOff',
    function()
      awful.spawn('system-control')
    end,
    {description = 'ShutDown Script', group = 'hotkeys'}
  ),

  -- awful.key(
  -- 	{modkey, "Control"},
  -- 	'l',
  -- 	function()
  -- 		awful.spawn('cinnamon-screensaver-command  -l')
  -- 	end,
  -- 	{description = 'lock Screen', group = 'hotkeys'}
  -- ),
  -- Screen management
  -- awful.key(
  -- 	{modkey},
  -- 	'o',
  -- 	awful.client.movetoscreen,
  -- 	{description = 'move window to next screen', group = 'client'}
  -- ),

  awful.key(
    { modkey }, "=", 
    function ()
      awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
    end,
    {description = "Toggle systray visibility", group = "Custom"}
  ),

  awful.key(
    {modkey},
    'F2',
    function()
      awful.spawn('randbg')
    end,
    {description = 'Random background', group = 'Custom'}
  )

)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key(
      { modkey }, "#" .. i + 9,
      function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                tag:view_only()
            end
      end,
      {description = "view tag #"..i, group = "tag"}
    ),

    -- Toggle tag display.
    awful.key(
      { modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
              awful.tag.viewtoggle(tag)
          end
      end,
      {description = "toggle tag #" .. i, group = "tag"}
    ),

    -- Move client to tag.
    awful.key(
      { modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      {description = "move focused client to tag #"..i, group = "tag"}
    ),

    -- Move client to tag and switch to tag.
    awful.key(
      { modkey, "Control" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()

          end
        end
      end,
      {description = "move focused client and switch to tag #"..i, group = "tag"}
    )

    -- Toggle tag on focused client.
    -- awful.key(
    -- 	{ modkey, "Control", "Shift" }, "#" .. i + 9,
    -- 	function ()
    -- 		if client.focus then
    -- 			local tag = client.focus.screen.tags[i]
    -- 			if tag then
    -- 				client.focus:toggle_tag(tag)
    -- 			end
    -- 		end
    -- 	end,
    -- 	{description = "toggle focused client on tag #" .. i, group = "tag"})
  )
end

root.keys(globalkeys)
