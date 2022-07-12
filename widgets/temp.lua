local awful = require("awful")
local beautiful = require("beautiful")
local container = require("widgets.container")
local dpi   = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local lain  = require("lain")
local markup = lain.util.markup
local wibox = require("wibox")

local function temp(args)

  local args = args or {}

  local icon =wibox.widget {
    {
        {
            forced_height=dpi(16),
            forced_width=dpi(16),
            widget = wibox.widget.imagebox(args.icon),
        },
        right=2,
        widget=wibox.container.margin

    },
    valign="center",
    widget = wibox.container.place
  }

  local popup = awful.popup{
    ontop = true,
    visible = false,
    shape = gears.shape.rounded_rect,
    border_width = 0,
    border_color = beautiful.border_focus,
    maximum_width = 600,
    offset = { y = 5, x=300 },
    widget = {
      {
        font = beautiful.font_fixedWidth,
        widget = wibox.widget.textbox
      },
      margins = 8,
      widget = wibox.container.margin
    }
}

local widget = container({
  layout = wibox.layout.fixed.horizontal,
  icon,
  lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(args.font, args.color, coretemp_now .. "°C "))
    end
  }).widget,
})

widget:buttons(awful.util.table.join(
    awful.button({""}, 1, function()
      if popup.visible then
        popup.visible = not popup.visible
      else
        awful.spawn.easy_async_with_shell ("sensors -A", function ( stdout,stderr, exitreason, exitcode )
          popup.widget.widget.text = stdout
        end)
          popup:move_next_to(mouse.current_widget_geometry)
      end
    end)
        ))

  return widget

end

return temp