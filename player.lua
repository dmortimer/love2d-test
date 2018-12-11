player = {
    speed = 2,
    x = 0,
    y = 0,
    width = 16,
    height = 32,

    direction = "right",
    bullets = {},
    bulletCooldown = 0,
    fire = function()
        if player.bulletCooldown <= 0 then
            player.bulletCooldown = 20
            bullet = {
                x = player.x,
                y = player.y + 5,
                direction = player.direction,
                speed = 8
            }
            table.insert(player.bullets, bullet)
        end
    end,
    -- x and y velocity
    dx = 0,
    dy = 0
}

function player:draw()
    love.graphics.setColor(255, 255, 255)
    -- player
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    -- bullets
    for i,b in pairs (player.bullets) do
        love.graphics.rectangle("fill", b.x, b.y, 2, 2)
    end
end

function player:update()



    -- bullet
    if player.bulletCooldown > 0 then
        player.bulletCooldown = player.bulletCooldown -1
    end
    if love.keyboard.isDown("space") then
        player.fire()
    end

    for i, b in pairs (player.bullets) do
        -- b.direction = player.direction
        if b.direction == "right" then
            b.x = b.x + b.speed
        elseif b.direction == "left" then
            b.x = b.x - b.speed
        end

        -- removes bullets off the screen
        if (b.x > 1000 or b.x < 0)then
            table.remove(player.bullets, i)
        end
    end
end