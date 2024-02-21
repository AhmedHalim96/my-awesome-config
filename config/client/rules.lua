local beautiful = require("beautiful")
local awful = require("awful")
local clientkeys = require('config.client.keys')
local clientbuttons = require("config.client.buttons")
local gears = require("gears")

local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{ rule = { },
		properties = { 
			border_color = beautiful.border_normal,
			border_width = beautiful.border_width,
			buttons = clientbuttons,
			focus = awful.client.focus.filter,
			has_border = true,
			has_titlebar = true,
			keys = clientkeys,
			maximized = false,
			maximized_horizontal = false,
			maximized_vertical = false,
			placement = awful.placement.no_offscreen+awful.placement.centered,
			raise = true,
			screen = awful.screen.preferred,
		},
		callback = function (c)
						-- adding right_click_menu
			c.right_click_menu = awful.menu({
				{ "Titlebars", 
					function() 
						c.has_titlebar = not c.has_titlebar
						awful.titlebar.toggle(c)
					end 
				},
				{ "on Top",    function() c.ontop    = not c.ontop     end },
				{ "Sticky",    function() c.sticky   = not c.sticky    end },
				{ "Floating",  function() c.floating = not c.floating  end },
				{ "Close",     function() c:kill()                     end } 
			})
				end

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
				"com-tonikelope-megabasterd-MainPanel",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin",  -- kalarm.
				"Wpa_gui",
				"veromix",
				"Qalculate",
				"Wine",
				"steam_proton",
				"xtightvncviewer",
				"java",
				"Plank",
				"Microsoft Teams - Preview",
				"Yad"
				
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester",  -- xev.
				"win0",
				"Cryptomator",
				"Picture in picture", --freetube
				"Media viewer"
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
			class = {
				"Plank"
			},
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
		}, properties = {  skip_taskbar = true }
	},

	-- uncenter
	{ rule_any = {
		instance = {"albert"},
		class = {
			"Plank",
			"Microsoft Teams - Preview"
		},
		name = {
			"MEGAsync"
		},
		role = {}
		}, properties = { placement=awful.placement.no_offscreen}
	},

	-- disable sloppy focus
	{ rule_any = {
			instance = {"albert", "copyq", "scratch"},
			class = {},
			name = {},
			role = {}
		}, properties = { disable_sloppy_focus = true},

	},
	
	-- Center dialogs to their parents
	{ rule_any = {
		type={"dialog"}
	}, properties = { },
	callback = function (c)
		awful.placement.centered(c, {parent=c.transient_for})
		awful.placement.no_offscreen(c)
	end
},



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
		class = {
			"Microsoft Teams - Preview"
		},
		name = {"Cryptomator"},
		role = {}
	}, properties = {  has_titlebar = false }},

	-- No borders
	{ rule_any = {
			instance = {
				"albert",
			},
			class = {
				"Plank"
			},
			name = {},
			role = {}
	}, properties = {  has_border = false }},


	--  Scratch
	{
				rule_any = {
						instance = { "scratch" },
						class = { "scratch" },
				},
				properties = {
			scratch_pad = true,
						floating = true,
						width = screen_width * 0.6,
						height = screen_height * 0.65,
				},
				callback = function (c)
						awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
						gears.timer.delayed_call(function()
								c.urgent = false
						end)	
				end
		},

	-- 1st Tag clients [browsers] 
	{ 
		rule_any = { class = { "Google-chrome", "Brave-browser" } },
		properties = { screen = 1, tag = "1" }
	},

	-- 2nd workspace for Editors and IDEs
	{ rule_any = { 
			class = {
				"VSCodium", 
				"VSCode",
				"Code", 
				"DrRacket", 
				"jetbrains-phpstorm", 
				"jetbrains-pycharm-ce", 
				"jetbrains-studio", 
				"jetbrains-idea-ce"
			} 
		},
		properties = { screen = 1, tag = "2" } 
	},

	-- 3rd Tag clients 
	{ 
		rule_any = { class = { "NpmServer" } },
		properties = { screen = 1, tag = "3" }
	},

	-- 4th Tag clients 
	{ 
		rule_any = { class = { "TelegramDesktop", "Insomnia" } },
		properties = { screen = 1, tag = "4" }
	},

	-- 5th Tag clients 
	{ 
		rule_any = { class = { "clemintine" } },
		properties = { screen = 1, tag = "5" }
	},

	-- 6th Tag clients 
	{ 
		rule_any = { class = {"FreeTube"} },
		properties = { screen = 1, tag = "6" }
	},

	-- 7th Tag clients 
	{ 
		rule_any = {  },
		properties = { screen = 1, tag = "7" }
	},

	-- 8th Tag clients 
	{ 
    rule_any = {
			instance = {  "www.notion.so" },
			class = { "ticktick" }
		},
		properties = { screen = 1, tag = "8" }
	},

	-- 9th Tag clients 
	{ 
    rule_any = {
			class = {  "Microsoft Teams - Preview", "Wine" , "steam_proton", 'easyeffects' }
		},
		properties = { screen = 1, tag = "9" }
	},

	-- Nsxiv 
	{ 
		rule = { class = "Nsxiv" },
		properties = { fullscreen = true, }
	},

	-- chrome devtools,Disgusting!  & brave devtools  
	{ 
		rule_any = { class = { "Google-chromea", "Brave-browser" }, role = "pop-up" },
		properties = { floating = false }
	},
	
}
