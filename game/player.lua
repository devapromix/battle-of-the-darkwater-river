local player = {
	race = "",
	name = "GOBLINHUNTER",
	health = 100,
	
}

function player.clear()
	inventory.clear()
end

function player.modify_health(value)
	player.health = player.health + value
end

























return player