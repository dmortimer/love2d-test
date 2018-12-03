player = {
    speed = 2,
    x = 0,
    y = 0,
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

}