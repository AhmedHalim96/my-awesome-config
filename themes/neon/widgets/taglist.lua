local awful = require("awful")
local beautiful = require("beautiful")
local dpi   = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")

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
    create_callback = function(self, c, index, objects)
        self:connect_signal('mouse::enter', function()
            self.bg = beautiful.bg_focus
        end)
        self:connect_signal('mouse::leave', function()
            local selected_tag = mouse.screen.selected_tag
           if selected_tag then
                if mouse.screen.selected_tag.index ~= index then
                    self.bg = beautiful.bg
                end
           else  self.bg = beautiful.bg
           end
        end)
    end,

        id     = 'background_role',
        widget = wibox.container.background,
        
    },


}
end

return taglist