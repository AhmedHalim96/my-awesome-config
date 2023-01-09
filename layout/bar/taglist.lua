local awful = require("awful")
local beautiful = require("beautiful")
local dpi   = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

-- taglist buttons
awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local function taglist(s)
  s.taglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = awful.util.taglist_buttons,

    layout   = {
        layout  = wibox.layout.fixed.horizontal
    },
    widget_template = {
        {
            {          
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left  = dpi(10),
            right = dpi(10),              
            widget = wibox.container.margin
        },
        
    -- Add support for hover colors
    -- create_callback = function(self, c, index, objects)
    --     self:connect_signal('mouse::enter', function()
    --         self.bg = beautiful.bg_focus
    --     end)
    --     self:connect_signal('mouse::leave', function()
    --         local selected_tag = mouse.screen.selected_tag
    --        if selected_tag then
    --             if mouse.screen.selected_tag.index ~= index then
    --                 self.bg = beautiful.bg
    --             end
    --        else  self.bg = beautiful.bg
    --        end
    --     end)
    -- end,

        id     = 'background_role',
        widget = wibox.container.background,
        
    },


}
end

return taglist