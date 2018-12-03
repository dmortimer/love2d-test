
require "player"
require "controls"

function love.load()
    platform = {
        width = love.graphics.getWidth(),
	    height = love.graphics.getHeight(),
        x = 0,                         
        y = love.graphics.getHeight() -5
    }

end

function love.update(dt)
    controls.onKeyPress()
end

function love.draw()
    -- love.graphics.print("Hello World", 400, 300)
    -- player
    love.graphics.rectangle("fill", player.x, player.y, 10, 10)
    -- bullets
    love.graphics.setColor(255, 255, 255)
    for i, b in pairs (player.bullets) do
        love.graphics.rectangle("fill", b.x, b.y, 2, 2)
    end
    -- platform
    love.graphics.setColor(123, 255, 105)
    love.graphics.rectangle("fill", platform.x, platform.y, platform.width, platform.height)

end