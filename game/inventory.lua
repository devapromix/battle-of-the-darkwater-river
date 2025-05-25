local inventory = {
	items = {}
}

function inventory.add_item(item_name, amount)
    amount = amount or 1
    
    if amount <= 0 then
        return false, "Amount must be positive"
    end
    
    if inventory.items[item_name] then
        inventory.items[item_name] = inventory.items[item_name] + amount
        return true
    else
        local current_items = 0
        for _ in pairs(inventory.items) do
            current_items = current_items + 1
        end
        
        if current_items >= config.inventory.max_slots then
            return false, "Inventory is full"
        end
        
        inventory.items[item_name] = amount
        return true
    end
end

function inventory.remove_item(item_name, amount)
    amount = amount or 1
    
    if amount <= 0 then
        return false, "Amount must be positive"
    end
    
    if not inventory.items[item_name] then
        return false, "Item not in inventory"
    end
    
    if inventory.items[item_name] < amount then
        return false, "Not enough items"
    end
    
    inventory.items[item_name] = inventory.items[item_name] - amount
    
    if inventory.items[item_name] <= 0 then
        inventory.items[item_name] = nil
    end
    
    return true
end

function inventory.has_item(item_name, amount)
    amount = amount or 1
    
    if not inventory.items[item_name] then
        return false
    end
    
    return inventory.items[item_name] >= amount
end

function inventory.get_item_count(item_name)
    return inventory.items[item_name] or 0
end

function inventory.get_all_items()
    local items_list = {}
    
    for item, count in pairs(inventory.items) do
        items_list[item] = count
    end
    
    return items_list
end

function inventory.clear()
    inventory.items = {}
end

function inventory.draw(y)
	y = y + 2
    love.graphics.print("INVENTORY", config.panel.left, y * config.font.height)
	y = y + 1
    if next(inventory.items) == nil then
        love.graphics.print("(empty)", config.panel.left, y * config.font.height)
		y = y + 1
        return
    end
    
    for item, count in pairs(inventory.items) do
        if count > 1 then
            love.graphics.print(item .. " (" .. count .. ")", config.panel.left, y * config.font.height)	
			y = y + 1
        else
            love.graphics.print(item, config.panel.left, y * config.font.height)
			y = y + 1
        end
    end
end

return inventory