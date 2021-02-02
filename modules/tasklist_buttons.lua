local awful = require("awful")
local gears = require("gears")
local dpi   = require("beautiful.xresources").apply_dpi

local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            -- not sure what this line does
            c:emit_signal("request::activate", "tasklist", {raise = true})

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function (c)
        if not c.right_click_menu then
            c.right_click_menu = awful.menu{ items = {
                { "on Top",   function() c.ontop    = not c.ontop     end },
                { "Sticky",   function() c.sticky   = not c.sticky    end },
                { "Floating", function() c.floating = not c.floating  end },
                { "Close",    function() c:kill()                     end } 
            }} 
        end
       
        c.right_click_menu:toggle()
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)
