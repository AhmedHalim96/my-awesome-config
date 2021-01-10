local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi   = require("beautiful.xresources").apply_dpi

local function renderClient(client, mode)
  if client.skip_decoration or (client.rendering_mode == mode) then
    return
  end

if awful.layout.get(client.screen) ~=  awful.layout.suit.floating then
  client.rendering_mode = mode
  -- client.floating = false
  client.maximized = false
  -- client.above = false
  -- client.below = false
  -- client.ontop = false
  -- client.sticky = false
  client.maximized_horizontal = false
  client.maximized_vertical = false
end

  if client.rendering_mode == 'maximized' then
    client.border_width = 0
    client.shape = function(cr, w, h)
      gears.shape.rectangle(cr, w, h)
    end
  elseif client.rendering_mode == 'tiled' then
    client.border_width = beautiful.border_width
    client.shape = function(cr, w, h)
      gears.shape.rounded_rect(cr, w, h, dpi(5))
    end
 
  end
end


function manage_titlebars(c)
  --   show titlebars only in floating layout

  if (awful.layout.get(client.screen) ==  awful.layout.suit.floating) 
  then
    awful.titlebar.show(c)
  end
 
  if (awful.layout.get(client.screen) ==  awful.layout.suit.tile) 
  then
    awful.titlebar.hide(c)
  end
 
  if (awful.layout.get(client.screen) ==  awful.layout.suit.max) 
  then
    awful.titlebar.hide(c)
  end
end


local changesOnScreenCalled = false

local function changesOnScreen(currentScreen)
  local tagIsMax = currentScreen.selected_tag ~= nil and currentScreen.selected_tag.layout == awful.layout.suit.max
  local clientsToManage = {}
  
  for _, client in pairs(currentScreen.clients) do
    if not client.skip_decoration and not client.hidden then
      table.insert(clientsToManage, client)
    end
  end

  if (tagIsMax or #clientsToManage == 1) then
    currentScreen.client_mode = 'maximized'
  else
    currentScreen.client_mode = 'tiled'
  end

  for _, client in pairs(clientsToManage) do
    renderClient(client, currentScreen.client_mode)
   if not client.no_titlebar then
    manage_titlebars(client)
   end
  end
  changesOnScreenCalled = false
end

local function clientCallback(client)
  if not changesOnScreenCalled then
    if not client.skip_decoration and client.screen then
      changesOnScreenCalled = true
      local screen = client.screen
      gears.timer.delayed_call(
        function()
          changesOnScreen(screen)
        end
      )
    end
  end
end

local function tagCallback(tag)
  if not changesOnScreenCalled then
    if tag.screen then
      changesOnScreenCalled = true
      local screen = tag.screen
      gears.timer.delayed_call(
        function()
          changesOnScreen(screen)
        end
      )
    end
  end
end

_G.client.connect_signal('manage', clientCallback)


_G.client.connect_signal('unmanage', clientCallback)


_G.client.connect_signal('property::hidden', clientCallback)


_G.client.connect_signal('property::minimized', clientCallback)


_G.client.connect_signal(
  'property::fullscreen',
  function(c)
    if c.fullscreen then
      renderClient(c, 'maximized')
    else
      clientCallback(c)
    end
  end
)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
  local only_one = #s.tiled_clients == 1
  for _, c in pairs(s.clients) do
      if ( only_one and (not c.floating or c.maximized)) or c.fullscreen then
          c.border_width = 0
      
      else 
          c.border_width = beautiful.border_width
      end
  end
end)  

_G.tag.connect_signal('property::selected', tagCallback)


_G.tag.connect_signal('property::layout', tagCallback)

