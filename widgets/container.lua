local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

function container(widget)
  return wibox.widget {
    {
        widget = widget,
    },
    top = 0,
    widget = wibox.container.margin
  } 
end

return container