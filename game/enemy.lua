local enemy = {}

function enemy.load()
	local file, size = love.filesystem.read("assets/data/enemies.json")
	local data = json.decode(file)
	enemy.current = {}
	enemy.enemies = data["enemies"]
end

return enemy