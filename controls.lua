controls = {}
function controls:onKeyPress()
    -- movement
    if love.keyboard.isDown("right") then
        player.x = math.min(player.x + player.speed, map.mapWidthPixels - player.width)
        player.direction = "right"
    elseif love.keyboard.isDown("left") then
        player.x = math.max(0, player.x - player.speed)
        player.direction = "left"
    elseif love.keyboard.isDown("up") then
        player.y = math.max(0, player.y - player.speed)
    elseif love.keyboard.isDown("down") then
        -- print(player.y)
        print(map.camY)
        player.y = math.min(player.y + player.speed, map.mapHeightPixels - player.height)
    elseif love.keyboard.isDown("escape") then
        love.event.quit()
    end
    
end