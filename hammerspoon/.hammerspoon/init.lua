hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon

-- utils
utils = require('utils')

utils.remap({'alt'}, 't', function()
  hs.application.open("iTerm")
end)

utils.remap({'ctrl'}, 'h', utils.pressFn('left'))
utils.remap({'ctrl'}, 'j', utils.pressFn('down'))
utils.remap({'ctrl'}, 'k', utils.pressFn('up'))
utils.remap({'ctrl'}, 'l', utils.pressFn('right'))

utils.remap({'ctrl', 'shift'}, 'h', utils.pressFn({'shift'}, 'left'))
utils.remap({'ctrl', 'shift'}, 'j', utils.pressFn({'shift'}, 'down'))
utils.remap({'ctrl', 'shift'}, 'k', utils.pressFn({'shift'}, 'up'))
utils.remap({'ctrl', 'shift'}, 'l', utils.pressFn({'shift'}, 'right'))

utils.remap({'ctrl', 'cmd'}, 'h', utils.pressFn({'cmd'}, 'left'))
utils.remap({'ctrl', 'cmd'}, 'j', utils.pressFn({'cmd'}, 'down'))
utils.remap({'ctrl', 'cmd'}, 'k', utils.pressFn({'cmd'}, 'up'))
utils.remap({'ctrl', 'cmd'}, 'l', utils.pressFn({'cmd'}, 'right'))

utils.remap({'ctrl', 'alt'}, 'h', utils.pressFn({'alt'}, 'left'))
utils.remap({'ctrl', 'alt'}, 'j', utils.pressFn({'alt'}, 'down'))
utils.remap({'ctrl', 'alt'}, 'k', utils.pressFn({'alt'}, 'up'))
utils.remap({'ctrl', 'alt'}, 'l', utils.pressFn({'alt'}, 'right'))

utils.remap({'ctrl', 'shift', 'cmd'}, 'h', utils.pressFn({'shift', 'cmd'}, 'left'))
utils.remap({'ctrl', 'shift', 'cmd'}, 'j', utils.pressFn({'shift', 'cmd'}, 'down'))
utils.remap({'ctrl', 'shift', 'cmd'}, 'k', utils.pressFn({'shift', 'cmd'}, 'up'))
utils.remap({'ctrl', 'shift', 'cmd'}, 'l', utils.pressFn({'shift', 'cmd'}, 'right'))

utils.remap({'ctrl', 'shift', 'alt'}, 'h', utils.pressFn({'shift', 'alt'}, 'left'))
utils.remap({'ctrl', 'shift', 'alt'}, 'j', utils.pressFn({'shift', 'alt'}, 'down'))
utils.remap({'ctrl', 'shift', 'alt'}, 'k', utils.pressFn({'shift', 'alt'}, 'up'))
utils.remap({'ctrl', 'shift', 'alt'}, 'l', utils.pressFn({'shift', 'alt'}, 'right'))

utils.remap({'ctrl', 'cmd', 'alt'}, 'h', utils.pressFn({'cmd', 'alt'}, 'left'))
utils.remap({'ctrl', 'cmd', 'alt'}, 'j', utils.pressFn({'cmd', 'alt'}, 'down'))
utils.remap({'ctrl', 'cmd', 'alt'}, 'k', utils.pressFn({'cmd', 'alt'}, 'up'))
utils.remap({'ctrl', 'cmd', 'alt'}, 'l', utils.pressFn({'cmd', 'alt'}, 'right'))

utils.remap({'ctrl', 'cmd', 'alt', 'shift'}, 'h', utils.pressFn({'cmd', 'alt', 'shift'}, 'left'))
utils.remap({'ctrl', 'cmd', 'alt', 'shift'}, 'j', utils.pressFn({'cmd', 'alt', 'shift'}, 'down'))
utils.remap({'ctrl', 'cmd', 'alt', 'shift'}, 'k', utils.pressFn({'cmd', 'alt', 'shift'}, 'up'))
utils.remap({'ctrl', 'cmd', 'alt', 'shift'}, 'l', utils.pressFn({'cmd', 'alt', 'shift'}, 'right'))

-- imports
yabai = require("yabai")