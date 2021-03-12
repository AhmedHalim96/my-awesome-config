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
			has_titlebar = true,
			has_border = true
		}
	},

	-- Floating clients.
	{ rule_any = {
			instance = {
				"DTA",  -- Firefox addon DownThemAll.
				"copyq",  -- Includes session name in class.
				"pinentry",
				"xdman",
				--"smplayer",
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
				"Cryptomator",
				"Picture in picture" --freetube
			},
			role = {
				"AlarmWindow",  -- Thunderbird's calendar.
				"ConfigManager",  -- Thunderbird's about:config.
				"pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
			},
			type = { "splash", "dialog" }
		}, properties = { floating = true }},

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
				-- "Picture-in-Picture", -- Firefox pip mode,
				-- "Picture in picture",--freetube
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
				"MEGAsync"
			},
			role = {}
		}, properties = { placement=awful.placement.no_offscreen}},

		-- disable sloppy focus
		{ rule_any = {
			instance = {"albert", "copyq"},
			class = {},
			name = {},
			role = {}
		}, properties = { disable_sloppy_focus = true}},



	-- Add titlebars to normal clients and dialogs
	-- { rule_any = {type = { "normal", "dialog" }
	--   }, properties = { titlebars_enabled = true }
	-- },
	-- No Title bars
	{ rule_any = {
		instance = {
			"albert",
			"xdman",
			"celluloid"
		},
		class = {},
		name = {"Cryptomator"},
		role = {}
	}, properties = {  has_titlebar = false }},

		-- No borders
		{ rule_any = {
			instance = {
				"albert",
			},
			class = {},
			name = {},
			role = {}
		}, properties = {  has_border = false }},

		
	-- 2nd workspace for Editors and IDEs
	{ rule_any = { class = {"VSCodium", "VSCode", "DrRacket", "jetbrains-phpstorm", "jetbrains-pycharm-ce", "jetbrains-studio"} },
		properties = { screen = 1, tag = "2" } },
		
	-- clemintine
	{ rule = { class = "Clementine" },
	  properties = { screen = 1, tag = "5" } },
	
	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
