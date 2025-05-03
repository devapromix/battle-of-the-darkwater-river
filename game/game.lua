local game = {
	lines = {},
	background = nil,
	current_file = nil,
	
	locations = {},
	
	text = "",
	links = {
		file = {},
		text = {},
		location = {},
		commands = {},
	},
	commands = {},
}

function game.load()
	game.background = love.graphics.newImage("assets/backgrounds/background.png")
	game.load_location_from_file(1, "assets/data/start.json")
end

function game.clear_location()
	game.text = ""
	game.links = {
		file = {},
		text = {},
		location = {},
		commands = {}
	}
	commands = {}
end

function game.execute_commands(commands)
    if commands and commands ~= "" then
        local func, err = load(commands)
        if func then
            local success, result = pcall(func)
            if not success then
                print("Error executing commands: " .. result)
            end
        else
            print("Error loading commands: " .. err)
        end
    end
end

function game.draw_location()
	--love.graphics.draw(game.background, 0, 0)
	game.lines = string.split_text(game.text, config.text.width)
	for i = 1, #game.lines do
		love.graphics.print(game.lines[i], config.font.width, i * config.font.height)
	end
	for i = 1, #game.links.text do
		love.graphics.print(i..". "..game.links.text[i], config.font.width, (#game.lines + i + 1) * config.font.height)
	end
end

function game.draw_character()
	local y = 1
	love.graphics.print(player.name, config.panel.left, y * config.font.height)
	y = y + 1
	love.graphics.print("health: " .. player.health, config.panel.left, y * config.font.height)
end

function game.load_location(index)
	game.clear_location()
	if index <= #game.locations then
		game.text = game.locations[index]["text"]
		game.commands = game.locations[index]["commands"]
		game.execute_commands(game.commands)
		local links = game.locations[index]["links"]
		for i = 1, #links do
			table.insert(game.links.file, links[i].file)
			table.insert(game.links.text, links[i].text)
			table.insert(game.links.location, links[i].location)
			table.insert(game.links.commands, links[i].commands)
		end
	end	
end

function game.load_location_from_file(index, cur_file)
	if cur_file and cur_file ~= "" then
		game.current_file = cur_file
		local file, size = love.filesystem.read(game.current_file)
		local data = json.decode(file)
		game.location = {}
		game.locations = data["locations"]
	end
	if game.current_file ~= nil then
		game.load_location(index)
	end
end

function game.mousepressed(x, y)
	local line = 0
	for i = 1, 7 do
		if mouse.in_rect(config.font.width, 
			(#game.lines + i + 1) * config.font.height, 
			window.width - (config.font.width * 2), 
			config.font.height) then
			line = i
			break
		end
	end
	game.go_to_location(line)
end

function game.keypressed(key)
	local line = 0
	if key == "1" then
		line = 1
	elseif key == "2" then
		line = 2
	elseif key == "3" then
		line = 3
	elseif key == "4" then
		line = 4
	elseif key == "5" then
		line = 5
	elseif key == "6" then
		line = 6
	elseif key == "7" then
		line = 7
	end
	game.go_to_location(line)
end

function game.go_to_location(index)
	if index > 0 and index <= #game.links.text then
		game.execute_commands(game.links.commands[index])
		if game.links.file[index] ~= "" then
			game.load_location_from_file(game.links.location[index], game.links.file[index])
		else
			game.load_location(game.links.location[index])
		end
	end
end

return game