local event = {
    location = "",
    ident = "",
    enemy = {
        name = "",
        description = "",
    },
}

local function set_enemy_data(selected_enemy)
    event.enemy.name = selected_enemy.name
    event.enemy.description = selected_enemy.description
    event.enemy.image = selected_enemy.image
end

function event.load()
end

function event.start(loc)
    event.location = loc
    if event.location == "forest" then
        if love.math.random(3) < 3 then 
            event.ident = "forest.combat"
            local valid_enemies = {}
            for _, e in ipairs(enemy.enemies) do
                if e.rarity == "common" and e.level == player.level then
                    table.insert(valid_enemies, e)
                end
            end
            if #valid_enemies == 0 then
                local min_diff = math.huge
                for _, e in ipairs(enemy.enemies) do
                    if e.rarity == "common" then
                        local diff = math.abs(e.level - player.level)
                        if diff < min_diff then
                            min_diff = diff
                            valid_enemies = {e}
                        elseif diff == min_diff then
                            table.insert(valid_enemies, e)
                        end
                    end
                end
            end
            if #valid_enemies > 0 then
                local selected_enemy = valid_enemies[love.math.random(#valid_enemies)]
                set_enemy_data(selected_enemy)
            else
                event.ident = "forest.event"
            end
        else
            event.ident = "forest.event"
        end
    elseif event.location == "dragoncave" then
        event.ident = "dragon.combat"
        for _, e in ipairs(enemy.enemies) do
            if e.rarity == "unique" then
                set_enemy_data(e)
                break
            end
        end
    end
end

function event.draw()
    if event.location == "forest" then
        if event.ident == "forest.combat" then
            local enemy_data = nil
            for _, e in ipairs(enemy.enemies) do
                if e.name == event.enemy.name then
                    enemy_data = e
                    break
                end
            end
            game.text = event.enemy.name .. " " .. event.enemy.description .. ": Health: " .. (enemy_data and enemy_data.health or 30) .. "/" .. (enemy_data and enemy_data.health or 30)
            game.image = love.graphics.newImage(event.enemy.image)
        elseif event.ident == "forest.event" then
            game.text = "Event: Find gold event..."
        end
    elseif event.location == "dragoncave" then
        local enemy_data = nil
        for _, e in ipairs(enemy.enemies) do
            if e.name == event.enemy.name then
                enemy_data = e
                break
            end
        end
        game.text = event.enemy.name .. " " .. event.enemy.description .. ": Health: " .. (enemy_data and enemy_data.health or 100) .. "/" .. (enemy_data and enemy_data.health or 100)
        game.image = love.graphics.newImage(event.enemy.image)
    end
end

return event