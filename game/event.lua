local event = {
	location = "",
	ident = "",
	enemy = {
		name = "",
	},
}

function event.load()

end

function event.start(loc)
	event.location = loc
	if event.location == "forest" then
		if love.math.random(3) < 3 then 
			event.ident = "forest.combat"
			event.enemy.name = enemy.enemies[1]["name"]
		else
			event.ident = "forest.event"
		end
	elseif event.location == "dragoncave" then
		event.ident = "dragon.combat"
		event.enemy.name = "Black Dragon"
	end
end

function event.draw()
	if event.location == "forest" then
		if event.ident == "forest.combat" then
			game.text = event.enemy.name .. ": A hungry wild wolf snarls at you, its fur bristling and eyes burning with fury. It has spent most of its life in this forest, surviving through battles for food and territory. Its body is covered in scars — marks of countless fights — yet its gaze still burns with wild determination. Health: 30/30"
		elseif event.ident == "forest.event" then
			game.text = "Event: Find gold event..."
		end
	elseif event.location == "dragoncave" then

	end

end

return event