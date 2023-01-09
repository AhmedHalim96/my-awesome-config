local awful = require("awful")
local beautiful = require("beautiful")
local dpi   = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

-- Tasklist Buttons
awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            -- not sure what this line does
            c:emit_signal("request::activate", "tasklist", {raise = true})

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function (c)
        c.right_click_menu:toggle()
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)


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
                            forced_height=dpi(18),
                            forced_width=dpi(18),
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