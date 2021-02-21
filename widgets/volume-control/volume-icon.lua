local wibox = require("wibox")

local base_path = os.getenv("HOME")..'/.config/awesome/widgets/volume-control/'
local icon = "audio-volume-high-symbolic.svg"

  local volume_icon = wibox.widget {
    {
      {
        image = base_path..icon,
        widget = wibox.widget.imagebox,
      },
      valign = 'center',
      widget = wibox.container.place,
    },
    forced_height=16,
    forced_width=16,
    right=2,
    widget = wibox.container.margin
  }
  
  return volume_icon    