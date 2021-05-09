local awful = require("awful")
local beautiful = require("beautiful")
local container = require("widgets.container")
local dpi   = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local lain  = require("lain")
local markup = lain.util.markup
local wibox = require("wibox")

local function net(args)

  local netdownicon = wibox.widget {
    {
        {
            forced_height=dpi(12),
            forced_width=dpi(12),
            widget=wibox.widget.imagebox(args.netdownicon)
        },
        valign="center",
        halign="center",
        widget=wibox.container.place
    },
    right=3,
    top=3,
    widget=wibox.container.margin
  }

  local netdowninfo = wibox.widget.textbox()

  local netupicon = wibox.widget {
    {
        {
            forced_height=dpi(12),
            forced_width=dpi(12),
            widget=wibox.widget.imagebox(args.netupicon)
        },
        valign="center",
        halign="center",
        widget=wibox.container.place
    },
    right=3,
    left=6,
    top=3,
    widget=wibox.container.margin
  }

  local netupinfo = lain.widget.net({
    settings = function()
        -- if iface ~= "network off" and
        --    string.match(theme.weather.widget.text, "N/A")
        -- then
        --     theme.weather.update()
        -- end
  
        widget:set_markup(markup.fontfg(args.font, args.netupcolor, net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(args.font, args.netdowncolor, net_now.received .. " "))
    end
  })

  local widget =  container({
    layout = wibox.layout.fixed.horizontal,
    netdownicon,
    netdowninfo,
    netupicon,
    netupinfo.widget,
})

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
        font = "JetBrainsMono Nerd Font 10",
        widget = wibox.widget.textbox
      },
      margins = 8,
      widget = wibox.container.margin
    }
}

  widget:buttons(awful.util.table.join(
    awful.button({""}, 1, function()
      if popup.visible then
        popup.visible = not popup.visible
      else
        awful.spawn.easy_async_with_shell ("vnstat -d 10", function ( stdout,stderr, exitreason, exitcode )
          popup.widget.widget.text = stdout
        end)
          popup:move_next_to(mouse.current_widget_geometry)
      end
    end)
        ))

  return widget;
end

return net