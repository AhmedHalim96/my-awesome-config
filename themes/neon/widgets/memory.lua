local lain  = require("lain")
local markup = lain.util.markup
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local function memory(args)
  local memicon =wibox.widget {
    {
        {
            forced_height = dpi(20),
            forced_width = dpi(20),
            widget = wibox.widget.imagebox(args.icon),
        },
        valign="center",
        widget=wibox.container.place
    },
    right = dpi(4),
    widget = wibox.container.margin
  }
  
  local _mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(args.font, args.color, mem_now.used .. "M "))
    end
  })
  
  return {
    icon   = memicon,
    widget = _mem.widget
  }
    
end

return memory