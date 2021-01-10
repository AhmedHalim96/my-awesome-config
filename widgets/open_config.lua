local wibox = require("wibox")
local awful = require("awful")
local theme = require("themes.multicolor.theme")

local config_widget = wibox.widget {
  {
      image = theme.widget_config,
      widget = wibox.widget.imagebox,
  },
  forced_height=20,
  forced_width=20,
  top=5,
  left=2,
  widget = wibox.container.margin
}

config_widget:buttons(awful.util.table.join(
  awful.button({"","Control"}, 1, function(  )
      awful.spawn("awesome-config")
  end)
      ))

return config_widget