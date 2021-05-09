local wibox = require("wibox")

-- spacer
local seperator= require("widgets.seperator")

-- container
local container = require("widgets.container")


local function systray(s) 

    s.systray =  wibox.widget.systray()
    -- s.systray.visible = false 
    s.systray.set_base_size(18)

    s.systray = wibox.widget{
        layout=wibox.layout.fixed.horizontal,
        container({
            s.systray,
            valign = 'center',
            margins = 2,
            widget = wibox.container.place,
        }, {hover=false}),
        seperator
    }
end

return systray