local temp = require "widgets.temp"
-- ###########################################################
-- #Imports                          
-- ###########################################################

local gears = require("gears")
local lain  = require("lain")
local gtk = require("beautiful").gtk
local awful = require("awful")
local dpi   = require("beautiful.xresources").apply_dpi
local os = os

local gtk_theme = gtk.get_theme_variables()

-- ###########################################################
-- #Theme Variables
-- ###########################################################

local theme                                                    = {}
theme.confdir                                                  = os.getenv("HOME") .. "/.config/awesome/themes/neon"
theme.wallpaper                                                = "~/wall.jpg"
theme.font                                                     = "Noto Sans 10"
theme.bg_normal                                                = gtk_theme.bg_color
theme.bg_focus                                                 = gtk_theme.selected_bg_color
theme.bg_urgent                                                = gtk_theme.error_color
theme.fg_normal                                                = gtk_theme.fg_color
theme.fg_focus                                                 = gtk_theme.selected_fg_color
theme.fg_urgent                                                = gtk_theme.error_color
theme.fg_minimize                                              = gtk_theme.fg_color

theme.border_width                                             = dpi(2)
theme.border_normal                                            = gtk_theme.wm_border_unfocused_color
theme.border_focus                                             = gtk_theme.wm_border_focused_color
theme.border_marked                                            = gtk_theme.wm_border_focused_color

theme.menu_bg_focus                                            = gtk_theme.bg_color
theme.menu_border_width                                        = dpi(2)
theme.menu_border_color                                        = gtk_theme.wm_border_focused_color
theme.menu_width                                               = dpi(200)
theme.menu_submenu_icon                                        = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                                           = gtk_theme.fg_color
theme.menu_fg_focus                                            = gtk_theme.selected_fg_color
theme.menu_bg_normal                                           = gtk_theme.bg_color
theme.menu_bg_focus                                            = gtk_theme.selected_bg_color
theme.menu_height                                              = dpi(25)

theme.notification_max_width                                   = dpi(360)

theme.widget_temp                                              = theme.confdir .. "/icons/temp.svg"
theme.widget_uptime                                            = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                               = theme.confdir .. "/icons/cpu.svg"
theme.widget_config                                            = theme.confdir .. "/icons/gear.svg"
theme.widget_weather                                           = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                                = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                               = theme.confdir .. "/icons/mem.svg"
theme.widget_note                                              = theme.confdir .. "/icons/note.png"
theme.widget_note_on                                           = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                                           = theme.confdir .. "/icons/down.svg"
theme.widget_netup                                             = theme.confdir .. "/icons/up.svg"
theme.widget_mail                                              = theme.confdir .. "/icons/mail.png"
theme.widget_batt                                              = theme.confdir .. "/icons/bat.png"
theme.widget_clock                                             = theme.confdir .. "/icons/clock.svg"
theme.widget_vol                                               = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel                                      = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                                    = theme.confdir .. "/icons/square_b.png"

theme.tasklist_plain_task_name                                 = true
theme.tasklist_disable_icon                                    = false

theme.useless_gap                                              = dpi(3)
theme.icon_theme                                               = "Papirus-Dark"

theme.snap_border_width                                        = dpi(2)
theme.snapper_gap                                              = dpi(5)
theme.snap_bg                                                  = gtk_theme.selected_bg_color
theme.snap_shape                                               = gears.shape.rectangle

theme.layout_tile                                              = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                                          = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                                          = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                                        = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                                           = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                                             = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                                             = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                                            = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                                           = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                               = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                                        = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                                         = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                                          = theme.confdir .. "/icons/floating.png"

theme.titlebar_bg_normal                                       = gtk_theme.bg_color
theme.titlebar_bg                                              = gtk_theme.bg_color

theme.titlebar_close_button_normal                             = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus                              = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_focus_hover                       = theme.confdir .. "/icons/titlebar/close_hover.png"
theme.titlebar_close_button_normal_hover                       = theme.confdir .. "/icons/titlebar/close_hover.png"

theme.titlebar_minimize_button_normal                          = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus                           = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_minimize_button_focus_hover                     = theme.confdir .. "/icons/titlebar/minimize_hover.png"
theme.titlebar_minimize_button_normal_hover                    = theme.confdir .. "/icons/titlebar/minimize_hover.png"

theme.titlebar_ontop_button_normal_inactive                    = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive                     = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active                      = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active                       = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive                   = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive                    = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active                     = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active                      = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive                 = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive                  = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active                   = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active                    = theme.confdir .. "/icons/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive                = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive                 = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_focus_inactive_hover           = theme.confdir .. "/icons/titlebar/maximized_hover.png"
theme.titlebar_maximized_button_normal_inactive_hover          = theme.confdir .. "/icons/titlebar/maximized_hover.png"
theme.titlebar_maximized_button_normal_active                  = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_active                   = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active_hover            = theme.confdir .. "/icons/titlebar/maximized_hover.png"
theme.titlebar_maximized_button_focus_active_hover             = theme.confdir .. "/icons/titlebar/maximized_hover.png"

theme.widget_border_width                                      = dpi(0)
theme.widget_border_color                                      = gtk_theme.selected_bg_color
theme.widget_shape                                             = gears.shape.rounded_rect

theme.wibar_position                                           = 'top'
theme.wibar_height                                             = dpi(28) 
theme.wibar_opacity                                            = 0.9 
theme.wibar_shape                                              = gears.shape.rectangle 

return theme
