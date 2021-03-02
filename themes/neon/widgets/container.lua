local beautiful = require("beautiful")
local dpi   = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local wibox = require("wibox")
local colors = require ("themes.neon.config.colors")


local function container (widget, args)
  args = args or {}

  local hover = args.hover
  if args.hover == nil then
      hover = true
  end

  local shape = args.shape or beautiful.widget_shape  

  local _container = wibox.widget {
      {
         widget,
          left   = dpi(10),
          right  = dpi(10),
          top    = dpi(2),
          bottom = dpi(2),
          widget = wibox.container.margin
      },
      shape              = shape,
      shape_border_color = beautiful.widget_border_color,
      shape_border_width = beautiful.widget_border_width,
      bg                 = beautiful.bg,
      widget             = wibox.container.background
  }

  if hover then
      _container:connect_signal("mouse::enter", function (args)
          _container.bg = beautiful.bg_focus
      end)
      _container:connect_signal("mouse::leave",function ()
          _container.bg = beautiful.bg_normal
      end)
  end
  return wibox.widget {
    _container,
    valign="center",
    halign="center",
    widget=wibox.container.place
  }
end

return container