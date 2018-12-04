
require "player"
require "controls"

function love.load()
    platform = {
        width = love.graphics.getWidth(),
	    height = love.graphics.getHeight(),
        x = 0,                         
        y = love.graphics.getHeight() -5
    }

    tilemap = {
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 1, 1, 1, 1, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    }
    colors = {
        --Fill it with tables filled with RGB numbers
        {255, 255, 255},
        {255, 0, 0},
        {255, 0, 255},
        {0, 0, 255},
        {0, 255, 255}
    }
    for i,row in pairs(tilemap) do
        for j,tile in pairs(row) do
            print(tile, "i", i, "j", j)
            --First check if the tile is not zero
            if tile ~= 0 then
                --Set the color. .setColor() also accepts a table with 3 numbers.
                --We pass the table with as position the value of tile.
                --So if tile equals 3 then we pass colors[3] which is {255, 0, 255}
                love.graphics.setColor(colors[tile])
                --Draw the tile
                love.graphics.rectangle("fill", j * 25, i * 25, 25, 25)
            end 
        end
    end
end

function love.update(dt)
    controls.onKeyPress()
end

function love.draw()
    -- player
    love.graphics.rectangle("fill", player.x, player.y, 10, 10)
    -- bullets
    love.graphics.setColor(255, 255, 255)
    for i,b in pairs (player.bullets) do
        love.graphics.rectangle("fill", b.x, b.y, 2, 2)
    end
    -- platform
    -- love.graphics.setColor(123, 255, 105)
    -- love.graphics.rectangle("fill", platform.x, platform.y, platform.width, platform.height)



end