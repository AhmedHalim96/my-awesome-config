local awful = require('awful')
local beautiful = require('beautiful')

function manage_titlebars(c)
  --   show titlebars only in floating layout
  if (awful.layout.get(client.screen) ==  awful.layout.suit.floating) 
  then
    awful.titlebar.show(c)
  else
    awful.titlebar.hide(c)
  end
end

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)

  local only_one = #s.tiled_clients == 1
  for _, c in pairs(s.clients) do
	-- titlebars in floating layout
    if c.has_titlebar then
      manage_titlebars(c);
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


  
end)


