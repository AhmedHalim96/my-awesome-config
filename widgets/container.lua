
local dpi   = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local function container (widget, args)
    args = args or {}
    local hover = args.hover 
    if args.hover == nil then
        hover = true
    end

    local _container = wibox.widget {
        {
            widget,
            left   = dpi(8),
            right  = dpi(8),
            top    = dpi(2),
            bottom = dpi(2),
            widget = wibox.container.margin
        },
            shape              = args.shape or gears.shape.rounded_rect,
            shape_border_color = args.border_color or beautiful.widget_border_color,
            shape_border_width = args.border_width or beautiful.widget_border_width,
            bg                 = args.bg or beautiful.bg,
            widget             = wibox.container.background
    }

    if hover then
        _container:connect_signal("mouse::enter", function (args)
            _container.bg = args.bg_focus or beautiful.bg_focus
        end)
        _container:connect_signal("mouse::leave",function ()
            _container.bg = args.bg_normal or beautiful.bg_normal
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