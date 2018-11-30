
function love.load()
    player = {
        x = 0,
        y = 0,
        direction = "right",
        bullets = {},
        fire = function()
            bullet = {}
            bullet.x = player.x
            bullet.y = player.y + 5
            bullet.direction = player.direction
            table.insert(player.bullets, bullet)
        end,

    }
    -- player.x = 0
    -- player.y = 0
    -- player.bullets = {}
    -- player.fire = function()
    --     bullet = {}
    --     bullet.x = player.x
    --     bullet.y = player.y
    --     table.insert{player.bullets, bullet}
    -- end
end

function love.update(dt)
    -- movement
    if love.keyboard.isDown("right") then
        player.x = player.x + 1
        player.direction = "right"
    elseif love.keyboard.isDown("left") then
        player.x = player.x - 1
        player.direction = "left"
    elseif love.keyboard.isDown("up") then
        player.y = player.y - 1
    elseif love.keyboard.isDown("down") then
        player.y = player.y + 1
    end
    -- bullet
    if love.keyboard.isDown("space") then
        player.fire()
    end

    for i, b in pairs (player.bullets) do
        -- b.direction = player.direction
        if b.direction == "right" then
            b.x = b.x + 8
        elseif b.direction == "left" then
            b.x = b.x - 8
        end

        -- removes bullets off the screen
        if (b.x > 1000 or b.x < 0)then
            table.remove(player.bullets, i)
        end
    end
end

function love.draw()
    -- love.graphics.print("Hello World", 400, 300)
    love.graphics.rectangle("fill", player.x, player.y, 10, 10)
    love.graphics.setColor(255, 255, 255)
    for i, b in pairs (player.bullets) do
        love.graphics.rectangle("fill", b.x, b.y, 2, 2)
    end
end