local beautiful = require("beautiful")
local awful = require("awful")
local clientkeys = require('config.client_keys')
local clientbuttons = require("config.client_buttons")

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
			placement = awful.placement.no_offscreen+awful.placement.centered,
			no_titlebar = false 
		}
	},

	-- Floating clients.
	{ rule_any = {
			instance = {
				"DTA",  -- Firefox addon DownThemAll.
				"copyq",  -- Includes session name in class.
				"pinentry",
				"xdman",
				"smplayer",
				"xviewer",
				"megasync"
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
				"Wine",
				"xtightvncviewer",
				"java"
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester",  -- xev.
				"win0",
				"Cryptomator"
			},
			role = {
				"AlarmWindow",  -- Thunderbird's calendar.
				"ConfigManager",  -- Thunderbird's about:config.
				"pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
			},
			type = { "splash", "dialog" }
		}, properties = { floating = true, placement = awful.placement.no_offscreen+awful.placement.centered,}},

			-- OnTop clients.
		{ rule_any = {
			instance = {"Toolkit", "copyq"},
			class = {},
			name = {
				-- "Picture-in-Picture" -- Firefox pip mode,
			},
			role = {}
		}, properties = { ontop = true, above = true }},

		-- Not in taskbar clients.
		{ rule_any = {
			instance = {},
			class = {},
			name = {
				"Picture-in-Picture", -- Firefox pip mode,
				"JavaEmbeddedFrame",
				"MEGAsync"
			},
			role = {}
		}, properties = {  skip_taskbar = true }},
-- uncenter
		{ rule_any = {
			instance = {"albert"},
			class = {},
			name = {
			},
			role = {}
		}, properties = { placement=awful.placement.no_offscreen}},



	-- Add titlebars to normal clients and dialogs
	-- { rule_any = {type = { "normal", "dialog" }
	--   }, properties = { titlebars_enabled = true }
	-- },
	-- No Title bars
	{ rule_any = {
		instance = {
			"Telegram",
			"albert",
			"xdman",
			"celluloid"
		},
		class = {},
		name = {"Cryptomator"},
		role = {}
	}, properties = {  no_titlebar = true }},

	-- Workspaces
	-- 1 browsers
	{ rule_any = { class = { "Brave-browser","Chromium-browser"} },
		properties = { screen = 1, tag = "1" } },
		
	-- 2 Editors and IDEs
	{ rule_any = { class = {"VSCodium", "VSCode", "DrRacket", "jetbrains-phpstorm", "jetbrains-pycharm-ce", "jetbrains-studio"} },
		properties = { screen = 1, tag = "2" } },
		
	-- clemintine
	{ rule = { class = "Clementine" },
	  properties = { screen = 1, tag = "5" } },
	


	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}