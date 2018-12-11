
require "player"
require "controls"
require "map"

function love.load()
    map.create()
end

function love.update(dt)
    -- print(dt)
    controls:onKeyPress()
    map:update(dt)
    player:update()
end

function love.draw()

    love.graphics.translate(math.floor(-map.camX), math.floor(-map.camY))
    map:draw()
    player:draw()
end