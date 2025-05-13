local combat = {
	enemy_name = "",
	enemy_health = 0,
	enemy_max_health = 0,
}

function combat.start()
	combat.enemy_name = "Wolf"
end

function combat.draw()
	game.text = combat.enemy_name .. " A hungry wild wolf snarls at you, its fur bristling and eyes burning with fury. It has spent most of its life in this forest, surviving through battles for food and territory. Its body is covered in scars — marks of countless fights — yet its gaze still burns with wild determination. Health: 30/30"

end













return combat