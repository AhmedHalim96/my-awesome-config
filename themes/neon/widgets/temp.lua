local lain  = require("lain")
local markup = lain.util.markup
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi


local function temp(args)

  local args = args or {}

  local icon =wibox.widget {
    {
        {
            forced_height=dpi(16),
            forced_width=dpi(16),
            widget = wibox.widget.imagebox(args.icon),
        },
        right=2,
        widget=wibox.container.margin

    },
    valign="center",
    widget = wibox.container.place
  }



  return {
    icon=icon,
    widget=lain.widget.temp({
      settings = function()
          widget:set_markup(markup.fontfg(args.font, args.color, coretemp_now .. "°C "))
      end
    }).widget 
  }
end

return temp