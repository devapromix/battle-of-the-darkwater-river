local player = {
	race = "---",
	class = "---",
	name = "GOBLINHUNTER",
	health = 100,
	max_health = 100,
}

function player.clear()
	inventory.clear()
	player.race = "---"
	player.class = "---"
	player.health = player.max_health
end

function player.modify_health(value)
	player.health = player.health + value
	if player.health > player.max_health then
		player.health = player.max_health
	end
	if player.health < 0 then
		player.health = 0
	end
end

























return player