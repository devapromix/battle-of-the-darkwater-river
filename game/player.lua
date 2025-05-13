local player = {
	race = "---",
	class = "---",
	name = "DRAGONHUNTER",
	level = 1,
	exp = {
		cur = 0,
	},
	health = {
		cur = 100,
		max = 100,
	},
	mana = {
		cur = 100,
		max = 100,
	},
}

function player.clear()
	inventory.clear()
	player.race = "---"
	player.class = "---"
	player.level = 1
	player.exp.cur = 0
	player.health.to_max()
	player.mana.to_max()
end

function player.exp.to_string()
	return player.exp.cur .. "/" .. player.exp.next(player.level + 1)
end

function player.exp.next(value)
    if value < 2 then
        return 0
    end
    return 500 * (value - 1) + 500 * (value - 2) * (value - 1)
end

function player.exp.update(value)
    player.exp.cur = player.exp.cur + value
    if player.exp.cur >= player.exp.next(player.level + 1) then
        player.exp.cur = player.exp.cur - player.exp.next(player.level + 1)
        player.level = player.level + 1
        return true
    end
    return false
end

function player.health.to_string()
	return player.health.cur .. "/" .. player.health.max
end

function player.health.to_max()
	player.health.cur = player.health.max
end

function player.health.to_min()
	player.health.cur = 0
end

function player.health.modify(value)
	player.health.cur = player.health.cur + value
	if player.health.cur > player.health.max then
		player.health.to_max()
	end
	if player.health.cur < 0 then
		player.health.to_min()
	end
end

function player.mana.to_string()
	return player.mana.cur .. "/" .. player.mana.max
end

function player.mana.to_max()
	player.mana.cur = player.mana.max
end

function player.mana.to_min()
	player.mana.cur = 0
end

function player.mana.modify(value)
	player.mana.cur = player.mana.cur + value
	if player.mana.cur > player.mana.max then
		player.mana.to_max()
	end
	if player.mana.cur < 0 then
		player.mana.to_min()
	end
end






















return player