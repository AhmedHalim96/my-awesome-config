local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi



-- function round_corners(c)
-- 	c.shape = function(cr, w, h)
-- 		gears.shape.rounded_rect(cr, w, h, dpi(5))
-- 	end
-- end


-- Signal function to execute when a new client appears.
_G.client.connect_signal("manage", function (c)  

  -- Set the windows at the slave,
  if not awesome.startup then awful.client.setslave(c) end

  if _G.awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
  end
end
)


_G.client.connect_signal("unmanage", function (c)
  --
end
)
-- Add a titlebar if titlebars_enabled is set to true in the rules.
_G.client.connect_signal("request::titlebars", function(c)
    
  -- buttons for the titlebar
  local buttons = gears.table.join(
      awful.button({ }, 1, function()
          c:emit_signal("request::activate", "titlebar", {raise = true})
          awful.mouse.client.move(c)
      end),
      awful.button({ }, 3, function()
          c:emit_signal("request::activate", "titlebar", {raise = true})
          awful.mouse.client.resize(c)
      end)
  )

  awful.titlebar(c, {size=dpi(32)}) : setup {
      { -- Left
          {
            {
              forced_height=dpi(22),
              forced_width=dpi(22),
              widget = awful.titlebar.widget.iconwidget(c),
          },
    
          top=dpi(5),
          left=dpi(10),
          widget = wibox.container.margin
          },
          buttons = buttons,
          layout  = wibox.layout.fixed.horizontal
      },
      { -- Middle
          { -- Title
              align  = "center",
              widget = awful.titlebar.widget.titlewidget(c)
          },
          buttons = buttons,
          layout  = wibox.layout.flex.horizontal
      },
      { -- Right

        -- Minimize Button
        {
          {
            forced_height=dpi(14),
            forced_width=dpi(14),
            widget = awful.titlebar.widget.minimizebutton (c),
        },

        top=dpi(9),
        right=dpi(10),
        widget = wibox.container.margin
        },

        -- Maximize Button
        {
          {
            forced_height=dpi(14),
            forced_width=dpi(14),
            widget = awful.titlebar.widget.maximizedbutton(c),

        },

        top=dpi(9),
        right=dpi(10),
        widget = wibox.container.margin
        },


        -- Close Button
        {
          {
            forced_height=dpi(14),
            forced_width=dpi(14),
            widget = awful.titlebar.widget.closebutton    (c),

        },

        top=dpi(9),
        right=dpi(16),
        widget = wibox.container.margin
        },


        -- awful.titlebar.widget.floatingbutton (c),
        --   awful.titlebar.widget.stickybutton   (c),
        --   awful.titlebar.widget.ontopbutton    (c),
        
        layout = wibox.layout.fixed.horizontal()
      },
      layout = wibox.layout.align.horizontal
  }
end)

-- Enable sloppy focus, so that focus follows mouse.
_G.client.connect_signal("mouse::enter", function(c)
    if sloppy_focus_enabled then
      c:emit_signal("request::activate", "mouse_enter", {raise = false})
    end
end)

_G.client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
_G.client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- }}}