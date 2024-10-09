local game = {
	lines = {},
	background = nil,
	
	locations = {},
	
	text = "",
	links = {
		text = {},
		location = {},
	},
	commands = {},
}

function game.load()
	game.background = love.graphics.newImage("assets/backgrounds/background.png")
	local file, size = love.filesystem.read("assets/data/game.json")
	local data = json.decode(file)
	game.locations = data["locations"]
	game.load_location(1)
end

function game.clear_location()
	game.text = ""
	game.links = {
		text = {},
		location = {}
	}
	commands = {}
end

function game.draw_location()
	love.graphics.draw(game.background, 0, 0)
	game.lines = string.split_text(game.text, config.text.width)
	for i = 1, #game.lines do
		love.graphics.print(game.lines[i], config.font.width, i * config.font.height)
	end
	for i = 1, #game.links.text do
		love.graphics.print(i..". "..game.links.text[i], config.font.width, (#game.lines + i + 1) * config.font.height)
	end
end

function game.load_location(index)
	game.clear_location()
	if index < #game.locations then
		game.text = game.locations[index]["text"]
		local links = game.locations[index]["links"]
		for i = 1, #links do
			table.insert(game.links.text, links[i].text)
			table.insert(game.links.location, links[i].location)
		end
	end	
end

function game.mousepressed(x, y)
	local line = 0
	for i = 1, 3 do
		if mouse.in_rect(config.font.width, 
			(#game.lines + i + 1) * config.font.height, 
			window.width - (config.font.width * 2), 
			config.font.height) then
			line = i
			break
		end
	end
	if line > 0 and line <= #game.links.text then
		game.load_location(game.links.location[line])
	end
end

function game.keypressed(key)
	local line = 0
	if key == "1" then
		line = 1
	elseif key == "2" then
		line = 2
	elseif key == "3" then
		line = 3
	end
	if line > 0 and line <= #game.links.text then
		game.load_location(game.links.location[line])
	end
end

return game