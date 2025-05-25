local equipment = {
    slots = {
        weapon = nil,
        armor = nil
    }
}

function equipment.clear()
    equipment.slots.weapon = nil
    equipment.slots.armor = nil
end

function equipment.draw(y)
    y = y + 2
    love.graphics.print("EQUIPMENT", config.panel.left, y * config.font.height)
    y = y + 1
    
    local weapon_text = "Weapon: " .. (equipment.slots.weapon or "(empty)")
    love.graphics.print(weapon_text, config.panel.left, y * config.font.height)
    y = y + 1
    
    local armor_text = "Armor: " .. (equipment.slots.armor or "(empty)")
    love.graphics.print(armor_text, config.panel.left, y * config.font.height)
    y = y + 1
    
    return y
end

return equipment