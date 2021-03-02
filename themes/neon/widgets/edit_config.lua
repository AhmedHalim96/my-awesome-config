local awful = require("awful")
local container = require("themes.neon.widgets.container")
local dpi   = require("beautiful.xresources").apply_dpi
local lain  = require("lain")
local markup = lain.util.markup
local wibox = require("wibox")

local function config_widget(args)
  local _widget = container({
    layout=wibox.layout.fixed.horizontal,
    {
        {
            widget        = wibox.widget.imagebox(args.icon),
            forced_height = dpi(16),
            forced_width  = dpi(16),
        },
        valign="center",
        widget=wibox.container.place
    },
    {
        {
            widget=wibox.widget.textbox((markup(args.color, " Edit Config"))),
            font=args.font
        },
        align="center",
        widget=wibox.container.place
    }
    
  })
  
  _widget:buttons(awful.util.table.join(
    awful.button({"","Control"}, 1, function(  )
        awful.spawn("awesome-config")
    end)
        ))

  return _widget
  
end

return config_widget