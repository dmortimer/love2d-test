controls = {
    onKeyPress = function()
    -- movement
    if love.keyboard.isDown("right") then
            player.x = player.x + player.speed
            player.direction = "right"
        elseif love.keyboard.isDown("left") then
            player.x = player.x - player.speed
            player.direction = "left"
        elseif love.keyboard.isDown("up") then
            player.y = player.y - player.speed
        elseif love.keyboard.isDown("down") then
            player.y = player.y + player.speed
        end
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
}