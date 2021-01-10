local wibox = require("wibox")
local spawn = require("aweful.spawn")

function ram_widget(args)
  local font = args.font or "Monospace 11"
  local widget =wibox.widget {
    {
        text="RAM: " ,
        font = font,
        widget = wibox.widget.textbox,
    },
    {
      text= spawn("watch memory-monitor"),
      font = font,
      widget = wibox.widget.textbox,
  },
    bottom = 2,
    widget = wibox.container.margin
  }

  return widget
  
end

return ram_widget