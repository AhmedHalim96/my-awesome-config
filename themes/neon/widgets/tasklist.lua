local awful = require("awful")
local beautiful = require("beautiful")
local dpi   = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local function tasklist(s)
  s.tasklist =  awful.widget.tasklist {
    screen   = s,
    filter   = awful.widget.tasklist.filter.currenttags,
    buttons= awful.util.tasklist_buttons,
    
    style    = {
        shape_border_width = beautiful.widget_border_width,
        shape_border_color = beautiful.widget_border_color,
        shape  = gears.shape.rounded_rect,
    },
    layout   = {
        spacing = dpi(5),
        layout  = wibox.layout.flex.horizontal
    },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
    widget_template = {
        {
            {
                {
                    {
                        {
                            forced_height=dpi(16),
                            forced_width=dpi(16),
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        valign = 'center',
                        halign = 'center',
                        margins = 2,
                        widget = wibox.container.place,
                    },
                    margins = 2,
                    widget  = wibox.container.margin,
                },
                {
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    bottom = 2,
                    widget = wibox.container.margin,
                }
                ,
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 10,
            right = 10,
            widget = wibox.container.margin
        },
        
        -- Add support for hover colors
        create_callback = function(self, c, index, objects)
            self:connect_signal('mouse::enter', function()
                self.bg = beautiful.bg_focus
            end)
            self:connect_signal('mouse::leave', function()
                local focused_client = client.focus
                if c then
                    if focused_client ~= c then
                        self.bg = beautiful.bg   
                    end
                end 
            end)
        end,

        id     = 'background_role',
        widget = wibox.container.background,
    },
  }
end

return tasklist