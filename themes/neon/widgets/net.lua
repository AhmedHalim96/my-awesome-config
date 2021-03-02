local lain  = require("lain")
local markup = lain.util.markup
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local function net(args)

  local netdownicon = wibox.widget {
    {
        {
            forced_height=dpi(12),
            forced_width=dpi(12),
            widget=wibox.widget.imagebox(args.netdownicon)
        },
        valign="center",
        halign="center",
        widget=wibox.container.place
    },
    right=3,
    top=3,
    widget=wibox.container.margin
  }

  local netdowninfo = wibox.widget.textbox()

  local netupicon = wibox.widget {
    {
        {
            forced_height=dpi(12),
            forced_width=dpi(12),
            widget=wibox.widget.imagebox(args.netupicon)
        },
        valign="center",
        halign="center",
        widget=wibox.container.place
    },
    right=3,
    left=6,
    top=3,
    widget=wibox.container.margin
  }

  local netupinfo = lain.widget.net({
    settings = function()
        -- if iface ~= "network off" and
        --    string.match(theme.weather.widget.text, "N/A")
        -- then
        --     theme.weather.update()
        -- end
  
        widget:set_markup(markup.fontfg(args.font, args.netupcolor, net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(args.font, args.netdowncolor, net_now.received .. " "))
    end
  })

  return {
    up = {
      icon   = netupicon,
      widget = netupinfo.widget
    },
    down = {
      icon   = netdownicon,
      widget = netdowninfo
    }
  }
end

return net