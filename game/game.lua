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
	enemy.load()
	event.load()
	game.background = love.graphics.newImage("assets/backgrounds/background.png")
	game.load_location_from_file(1, "assets/data/start.json")
end

function game.clear()
	player.clear()
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

function game.draw_panel()
    local x = config.panel.left
    local font_height = config.font.height
    local y = font_height
    local graphics = love.graphics
    local player = player

    local panel_data = {
        player.name,
        "Level: " .. player.level,
        "Exp: " .. player.exp.to_string(),
        "Race: " .. player.race,
        "Class: " .. player.class,
        "Health: " .. player.health.to_string(),
        "Mana: " .. player.mana.to_string(),
		"Attack: " .. player.damage.to_string(),
		"Defense: " .. player.armor,
    }

    for i, text in ipairs(panel_data) do
        graphics.print(text, x, y)
        y = y + font_height
    end

    equipment.draw(9)
	
    inventory.draw(13)
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
    local line = tonumber(key)
    if line and line >= 1 and line <= 7 then
        game.go_to_location(line)
    end
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