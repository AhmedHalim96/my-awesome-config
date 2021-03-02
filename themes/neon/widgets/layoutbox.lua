local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


local layoutbox = wibox.widget{
  {
    awful.widget.layoutbox(),
    top = 4,
    bottom = 4,
    left=4, 
    right=4,
    widget=wibox.container.margin,
  },
  shape_border_width = beautiful.widget_border_width,
  shape_border_color = beautiful.widget_border_color,
  shape  = gears.shape.rectangle,
  widget = wibox.container.background,
}
layoutbox:buttons(my_table.join(
            awful.button({}, 1, function () awful.layout.inc( 1) end),
            awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
            awful.button({}, 3, function () awful.layout.inc(-1) end),
            awful.button({}, 4, function () awful.layout.inc( 1) end),
            awful.button({}, 5, function () awful.layout.inc(-1) end)
        )
    )
return layoutbox