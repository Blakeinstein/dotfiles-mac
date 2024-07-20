local yabai = "/opt/homebrew/bin/yabai"

utils = require('utils')

local function execYabai(args)
    local command = string.format("%s %s", yabai, args)
    print(string.format("yabai: %s", command))
    os.execute(command)
end

-- "directions" for vim keybindings
local directions = {
    h = "west",
    l = "east",
    k = "north",
    j = "south",
}
for key, direction in pairs(directions) do
    -- focus windows
    -- cmd + ctrl
    utils.remap({ "cmd", "ctrl" }, key, function()
        execYabai(string.format("-m window --focus %s", direction))
    end)
    -- move windows
    -- cmd + shift
    utils.remap({ "cmd", "shift" }, key, function()
        execYabai(string.format("-m window --warp %s", direction))
    end)
    -- swap windows
    -- alt + shift
    utils.remap({ "shift", "alt" }, key, function()
        execYabai(string.format("-m window --swap %s", direction))
    end)
end

-- window float settings
-- alt + shift
local floating = {
    -- full
    up = "1:1:0:0:1:1",
    -- left half
    left = "1:2:0:0:1:1",
    -- right half
    right = "1:2:1:0:1:1",
}
for key, gridConfig in pairs(floating) do
    utils.remap({ "alt", "shift" }, key, function()
        execYabai(string.format("--grid %s", gridConfig))
    end)
end
-- balance window size
utils.remap({ "alt", "shift" }, "0", function()
    execYabai("-m space --balance")
end)

-- layout settings
local layouts = {
    a = "bsp",
    d = "float",
}
for key, layout in pairs(layouts) do
    utils.remap({ "alt", "shift" }, key, function()
        execYabai(string.format("-m space --layout %s", layout))
    end)
end

-- toggle settings
local toggleArgs = {
    a = "-m space --toggle padding; yabai -m space --toggle gap",
    d = "-m window --toggle zoom-parent",
    e = "-m window --toggle split",
    f = "-m window --toggle zoom-fullscreen",
    o = "-m window --toggle topmost",
    r = "-m space --rotate 90",
    s = "-m window --toggle sticky",
    x = "-m space --mirror x-axis",
    y = "-m space --mirror y-axis",
}
for key, args in pairs(toggleArgs) do
    utils.remap({ "alt" }, key, function()
        execYabai(args)
    end)
end

-- throw/focus monitors
local targets = {
    x = "recent",
    z = "prev",
    c = "next",
}
for key, target in pairs(targets) do
    utils.remap({ "ctrl", "cmd" }, key, function() 
        execYabai(string.format("-m space --focus %s", target))
    end)
    utils.remap({ "ctrl", "alt" }, key, function()
        execYabai(string.format("-m display --focus %s", target))
    end)
    utils.remap({ "ctrl", "alt", "cmd" }, key, function()
        execYabai(string.format("-m window --display %s", target))
        execYabai(string.format("-m display --focus %s", target))
    end)
end
-- numbered monitors
for i = 1, 5 do
    utils.remap({ "ctrl", "alt" }, tostring(i), function()
        execYabai(string.format("-m display --focus %s", i))
    end)
    utils.remap({ "ctrl", "cmd" }, tostring(i), function()
        execYabai(string.format("-m window --display %s", i))
        execYabai(string.format("-m display --focus %s", i))
    end)
end

utils.remap(
    { "ctrl", "alt", "cmd" },
    "r",
    function()
        os.execute("launchctl kickstart -k \"gui/${UID}/homebrew.mxcl.yabai\"")
    end
)

return {
    yabai = yabai,
    execYabai = execYabai,
}
