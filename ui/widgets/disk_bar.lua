ocal awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- Set colors
local active_color = {
    type = 'linear',
    from = {0, 0},
    to = {200, 50}, -- replace with w,h later
    stops = {{0, beautiful.xcolor2}, {0.75, beautiful.xcolor10}}
}

local background_color = beautiful.xbackground

local disk_bar = wibox.widget {
    max_value = 100,
    value = 50,
    forced_height = dpi(10),
    margins = {top = dpi(8), bottom = dpi(8)},
    forced_width = dpi(200),
    shape = gears.shape.rounded_bar,
    bar_shape = gears.shape.rounded_bar,
    color = active_color,
    background_color = background_color,
    border_width = 0,
    border_color = beautiful.border_color,
    widget = wibox.widget.progressbar
}

awesome.connect_signal("signal::disk", function(used, total)
    disk_bar.value = tonumber(100 * used / total)
end)

return disk_bar
