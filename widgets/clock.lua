local colors = require("themes.neon.config.colors")
local lain  = require("lain")
local markup = lain.util.markup
local os = os
local wibox = require("wibox")




-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock

local function mytextclock(args)

local args = args or {}
local _mytextclock = wibox.widget.textclock(markup(colors.neon.blue, "%a %d %b ") .. (" ") .. markup(colors.neon.fuchsia, " %H:%M "))
_mytextclock.font = args.font or "monospace 10"

return _mytextclock

end

return mytextclock