-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- collision
require("collision")()

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors 
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
			-- Make sure we don't go into an endless error loop
			if in_error then return end
			in_error = true
			
			naughty.notify({ 
				preset = naughty.config.presets.critical,
				title = "Oops, an error happened!",
				text = tostring(err) 
			})
			in_error = false
	end)
end


--Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

terminal = "gnome-terminal"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
altkey = "Mod1"
browser = "firefox"
filemanager = "nemo"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}


-- Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
	{ "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{ "quit", function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
	mymainmenu = freedesktop.menu.build({
			before = { menu_awesome },
			after =  { menu_terminal }
	})
else
	mymainmenu = awful.menu({
		items = {
			menu_awesome,
			{ "Debian", debian.menu.Debian_menu.Debian },
			menu_terminal,
		}
	})
end


mylauncher = awful.widget.launcher({ 
	image = beautiful.awesome_icon,
	menu = mymainmenu
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({ }, 1, function(t) t:view_only() end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),

	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
				client.focus:toggle_tag(t)
		end
	end),

	awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
	awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
	awful.button(
	{ }, 1, 
	function (c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
				"request::activate",
				"tasklist",
				{raise = true}
			)
		end
	end),

	awful.button({ }, 3, 
	function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),

	awful.button({ }, 4, 
	function ()
		awful.client.focus.byidx(1)
	end),
	
	awful.button({ }, 5,
	function ()
	awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
				wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "Work1", "Work2", "Break1", "Break2" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
		-- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(
			gears.table.join(
				awful.button({ }, 1, function () awful.layout.inc( 1) end),
				awful.button({ }, 3, function () awful.layout.inc(-1) end),
				awful.button({ }, 4, function () awful.layout.inc( 1) end),
				awful.button({ }, 5, function () awful.layout.inc(-1) end)
			)
		)
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
			screen  = s,
			filter  = awful.widget.taglist.filter.all,
			buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
			layout = wibox.layout.align.horizontal,
			{ -- Left widgets
					layout = wibox.layout.fixed.horizontal,
					mylauncher,
					s.mytaglist,
					s.mypromptbox,
			},
			s.mytasklist, -- Middle widget
			{ -- Right widgets
					layout = wibox.layout.fixed.horizontal,
					mykeyboardlayout,
					wibox.widget.systray(),
					mytextclock,
					s.mylayoutbox,
			},
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- Key bindings

--- Globlal keys
globalkeys = gears.table.join(
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
			function(c)
				c.play()
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
				_G.exit_screen_show()
			end,
			{description = 'ShutDown Screen', group = 'hotkeys'}
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

-- Client Keys

clientkeys = gears.table.join(

	awful.key(
		{ modkey,}, "f",
		function (c)
				c.fullscreen = not c.fullscreen
				c:raise()
		end,
		{description = "toggle fullscreen", group = "client"}
	),

	awful.key(
		{ modkey }, "q",      
		function (c) c:kill() end,
		{description = "close", group = "client"}
	),

	awful.key(
		{ modkey, "Control" }, "space",  
		awful.client.floating.toggle                     ,
		{description = "toggle floating", group = "client"}
	),

	awful.key(
		{ modkey, "Control" }, "Return", 
		function (c) c:swap(awful.client.getmaster()) end,
		{description = "move to master", group = "client"}
	),

	awful.key(
		{ modkey,           }, "o",      
		function (c) c:move_to_screen()               end,
		{description = "move to screen", group = "client"}
	),

	awful.key(
		{ modkey,           }, "t",     
		function (c) c.ontop = not c.ontop            end,
		{description = "toggle keep on top", group = "client"}
	),

	awful.key(
		{ modkey,           }, "n",
		function (c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end ,
		{description = "minimize", group = "client"}
	),

	awful.key(
		{ modkey,           }, "m",
		function (c)
			c.maximized = not c.maximized
			c:raise()
		end ,
		{description = "(un)maximize", group = "client"}
	),

	awful.key(
		{ modkey, "Control" }, "m",
		function (c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end ,
		{description = "(un)maximize vertically", group = "client"}
	),

	awful.key(
		{ modkey, "Shift"   }, "m",
		function (c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end ,
		{description = "(un)maximize horizontally", group = "client"}
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

clientbuttons = gears.table.join(
	awful.button({ }, 1, function (c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
	end),
	awful.button({ modkey }, 1, function (c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function (c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{ rule = { },
		properties = { 
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	},

	-- Floating clients.
	{ rule_any = {
			instance = {
				"DTA",  -- Firefox addon DownThemAll.
				"copyq",  -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin",  -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer"},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester",  -- xev.
			},
			role = {
				"AlarmWindow",  -- Thunderbird's calendar.
				"ConfigManager",  -- Thunderbird's about:config.
				"pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
			}
		}, properties = { floating = true }},

	-- Add titlebars to normal clients and dialogs
	-- { rule_any = {type = { "normal", "dialog" }
	--   }, properties = { titlebars_enabled = true }
	-- },

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = false})
-- end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Xinput config
-- awful.util.spawn("bash -c '~/.config/awesome/touchpad.sh'")

-- Gaps
beautiful.useless_gap = 2

-- Autostart apps
awful.spawn.with_shell("picom --config '~/.config/awesome/picom.config'")
awful.spawn('nitrogen --restore')
awful.spawn.once("pnmixer")
awful.spawn.with_shell("nm-applet --indicator")
awful.spawn.with_shell("xfce4-power-manager")
awful.spawn.with_shell('numlockx on') -- enable numlock
awful.spawn.with_shell("qbittorrent")
awful.spawn.with_shell("copyq")
awful.spawn.with_shell("touchpad-indicator")