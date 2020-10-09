local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")


local globalkeys = gears.table.join(
	awful.key(
		{ modkey,}, "F1",
		hotkeys_popup.show_help,
		{description="show help", group="awesome"}
	),
	
	-- Workspace shortcut
	awful.key(
		{ altkey, 'Control'}, "Left",   
		awful.tag.viewprev,
		{description = "view previous", group = "tag"}),
			
	awful.key(
		{ altkey, 'Control'}, "Right",  
		awful.tag.viewnext,
		{description = "view next", group = "tag"}
	),

	awful.key(
		{ modkey,}, "d",
			function () awful.client.focus.byidx( 1) end,
		{description = "focus next by index", group = "client"}
	),

	awful.key(
		{ modkey,}, "a",
		function () awful.client.focus.byidx(-1) end,
		{description = "focus previous by index", group = "client"}
	),

	-- awful.key(
	-- 	{ modkey,}, "w", 
	-- 	function () mymainmenu:show() end,
	-- 	{description = "show main menu", group = "awesome"}
	-- ),

	-- Layout manipulation
	awful.key(
		{ modkey, "Shift"   }, "d", 
		function () awful.client.swap.byidx(  1)    end,
		{description = "swap with next client by index", group = "client"}
	),

	awful.key(
		{ modkey, "Shift"   }, "a",
	 	function () awful.client.swap.byidx( -1)    end,
		{description = "swap with previous client by index", group = "client"}
	),

	awful.key(
		{ modkey, "Control" }, "d", 
		function () awful.screen.focus_relative( 1) end,
		{description = "focus the next screen", group = "screen"}
	),

	awful.key(
		{ modkey, "Control" }, "a", 
		function () awful.screen.focus_relative(-1) end,
		{description = "focus the previous screen", group = "screen"}
	),

	awful.key(
		{ modkey,}, "u", 
		awful.client.urgent.jumpto,
		{description = "jump to urgent client", group = "client"}
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

	-- Programs
	awful.key(
		{ modkey,}, "Return", 
		function () awful.spawn(terminal) end,
		{description = "open a terminal", group = "launcher"}
	),
	awful.key(
		{ modkey,}, "b", 
		function () awful.spawn(browser) end,
		{description = "open default browser", group = "launcher"}
	),
	awful.key(
		{ modkey,}, "e", 
		function () awful.spawn(filemanager) end,
		{description = "open default filemanager", group = "launcher"}
	),
	awful.key(
		{ modkey,}, "s", 
		function () awful.spawn('gnome-system-monitor') end,
		{description = "open system monitor", group = "launcher"}
	),

	-- Awesome Control 
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
		{altkey, 'Shift'}, "Right",     
		function () awful.tag.incmwfact( 0.05)          end,
		{description = "increase master width factor", group = "layout"}
	),

	awful.key(
		{altkey, 'Shift'}, "Left",     
		function () awful.tag.incmwfact(-0.05)          end,
		{description = "decrease master width factor", group = "layout"}
	),
	awful.key(
    {altkey, 'Shift'},
    'Down',
    function()
      awful.client.incwfact(0.05)
    end,
    {description = 'decrease master height factor', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Up',
    function()
      awful.client.incwfact(-0.05)
    end,
    {description = 'increase master height factor', group = 'layout'}
  ),

	awful.key(
		{ modkey, "Shift"   }, "Right",     
		function () awful.tag.incnmaster( 1, nil, true) end,
		{description = "increase the number of master clients", group = "layout"}
	),

	awful.key(
		{ modkey, "Shift"   }, "Left",     
		function () awful.tag.incnmaster(-1, nil, true) end,
		{description = "decrease the number of master clients", group = "layout"}
	),

	awful.key(
		{ modkey, "Control" }, "Right",     
		function () awful.tag.incncol( 1, nil, true)    end,
		{description = "increase the number of columns", group = "layout"}
	),

	awful.key(
		{ modkey, "Control" }, "Left",     
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

	-- dmenu Run Prompt
	awful.key(
		{ modkey },"r",
		function () awful.util.spawn('dmenu_run') end,
		{description = "run prompt", group = "launcher"}
	),

	  -- Brightness
		awful.key(
			{},
			'XF86MonBrightnessUp',
			function()
				-- awful.spawn('xbacklight -inc 10')
				awful.spawn('light -A 10')
	
			end,
			{description = '+10%', group = 'hotkeys'}
		),
		awful.key(
			{},
			'XF86MonBrightnessDown',
			function()
				-- awful.spawn('xbacklight -dec 10')
				awful.spawn('light -U 10')
			end,
			{description = '-10%', group = 'hotkeys'}
		),
		-- ALSA volume control
		awful.key(
			{},
			'XF86AudioRaiseVolume',
			function()
				awful.spawn('amixer -D pulse sset Master 5%+')
			end,
			{description = 'volume up', group = 'hotkeys'}
		),
		awful.key(
			{},
			'XF86AudioLowerVolume',
			function()
				awful.spawn('amixer -D pulse sset Master 5%-')
			end,
			{description = 'volume down', group = 'hotkeys'}
		),
		awful.key(
			{},
			'XF86AudioMute',
			function()
				awful.spawn('amixer -D pulse set Master 1+ toggle')
			end,
			{description = 'toggle mute', group = 'hotkeys'}
		),
		awful.key(
			{},
			'XF86AudioNext',
			function()
				awful.spawn('playerctl next')
			end,
			{description = 'Next', group = 'hotkeys'}
		),
		awful.key(
			{},
			'XF86AudioPrev',
			function()
				awful.spawn('playerctl previous')
			end,
			{description = 'Previous', group = 'hotkeys'}
		),
		awful.key(
			{},
			'XF86AudioPlay',
			function()
				awful.spawn('playerctl play-pause')
			end,
			{description = 'Next', group = 'hotkeys'}
		),
		awful.key(
			{},
			'XF86PowerDown',
			
			function()
				--
			end,
			{description = 'toggle mute', group = 'hotkeys'}
		),
		awful.key(
			{},
			'XF86PowerOff',
			function()
				awful.spawn('system-control')
			end,
			{description = 'ShutDown Screen', group = 'hotkeys'}
		),
		awful.key(
			{modkey},
			'l',
			function()
				awful.spawn('i3lock-fancy -gp')
			end,
			{description = 'lock Screen', group = 'hotkeys'}
		),
		-- Screen management
		awful.key(
			{modkey},
			'o',
			awful.client.movetoscreen,
			{description = 'move window to next screen', group = 'client'}
		),

	-- Menubar
	awful.key(
	{ modkey }, "p", 
	function() menubar.show() end,
	{description = "show the menubar", group = "launcher"}
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
			{ modkey, "Control" }, "#" .. i + 9,
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

		-- Toggle tag on focused client.
		awful.key(
			{ modkey, "Control", "Shift" }, "#" .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{description = "toggle focused client on tag #" .. i, group = "tag"})
	)
end

return globalkeys