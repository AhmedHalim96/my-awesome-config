local wibox = require("wibox")
local colors = require("themes.neon.config.colors")
local lain  = require("lain")
local markup = lain.util.markup

local seperator = wibox.widget{
    {
        {
            font   = "noto sans 14",
            widget = wibox.widget.textbox(markup(colors.bg_light,'|'))
        },
        bottom=3,
        widget=wibox.container.margin,
    },
    valign="center",
    halign="center",
    widget=wibox.container.place
}

return seperator