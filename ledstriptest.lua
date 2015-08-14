local config = require('config')

local current_led = 1
local direction = 1

local function setRandomColor()
    current_led = current_led + direction
    if current_led >= config.LEDSTRIP_LENGTH then
        direction = -1
    elseif current_led <= 0 then
        direction = 1
    end

    ws2812.write(config.PIN_LEDSTRIP, string.char(0, 0, 0):rep(current_led)..string.char(math.random(255), math.random(255), math.random(255))..string.char(0, 0, 0))
end

local function start()
    tmr.alarm(2, 20, 1, setRandomColor)
end

return {start = start}
