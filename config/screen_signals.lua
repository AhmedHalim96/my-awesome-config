local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local lain = require("lain")
local screen = screen

  -- {{{ Screen
  -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
  screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
  end)

  function at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = beautiful.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s , awful.layout.suit.tile)

    -- Systray
    require("config.bar.systray")(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = require("widgets.layoutbox")

    -- Create a taglist widget
    require("config.bar.taglist")(s)

    -- Create a tasklist widget
    require("config.bar.tasklist")(s)
    
    -- Create the wibar
    require("config.bar.wibar")(s)

end

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) at_screen_connect(s) end)


screen.connect_signal("arrange", function (s)

    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
    -- titlebars in floating layout
      if (awful.layout.get(s) ==  awful.layout.suit.floating) then 
        awful.titlebar.show(c)
        awful.mouse.snap.edge_enabled = true
      else
        awful.titlebar.hide(c)
        awful.mouse.snap.edge_enabled = false
      end
      
      -- manage borders
      if ( only_one and (not c.floating or c.maximized)) 
          or c.fullscreen 
          or ((awful.layout.get(s) ==  awful.layout.suit.max) and not c.floating)
          or awful.layout.get(s) == awful.layout.suit.floating
          or c.maximized
          or not c.has_border then

          c.border_width = 0

      else 
          c.border_width = beautiful.border_width
      end
    end
  end
)

  -- }}}
