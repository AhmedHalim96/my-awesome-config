-- imports
local os = os
local theme = require('themes.neon.theme')
local wibox = require("wibox")
local colors = require("themes.neon.config.colors")
local lain  = require("lain")
local markup = lain.util.markup



-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon =wibox.widget {
	{
		image = theme.widget_clock,
		widget = wibox.widget.imagebox,
	},
	forced_height=20,
	forced_width=20,
	top=5,
	right=2,
	widget = wibox.container.margin
}

local textclock = wibox.widget.textclock(markup(colors.neon.blue, "%a %d %b ") .. markup(colors.white, "|") .. markup(colors.neon.fuchsia, " %H:%M "))
textclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
	attach_to = { textclock },
	notification_preset = {
		font = "Terminus 10",
		fg   = theme.fg_normal,
		bg   = theme.bg_normal
	}
})

local clock_widget = {
	icon=clockicon, 
	clock=textclock,
}

return clock_widget