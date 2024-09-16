local game = {
	lines = {},

	text = "",
	links = {},

	text = "Громкие завывания разочаровавшихся гоблинов ясно свидетельствуют о протесте, но Вы настаиваете на своем. Главный нарушитель спокойствия - гоблин по имени Черноглаз - бросает вызов вашему авторитету. Он заявляет о том, что они будут делать что хотят и никто им в этом не будет помехой. Некоторые гоблины начинают соглашаться с ним...",
	links = {
		text = {
			"Отступить и дать им свободу выбора...",
			"Попытаться убить Черноглаза из-за неповиновения...",
			},
		location = {
			1,
			2,
		},
		commands = {},
	},
}

function mouse_in_rect(x, y, left, top, width, height)
	return (x >= left) and (y >= top) and (x <= left + width) and (y <= top + height)
end

function split(s, pat)
   local i = 1
   result = {}
   while true do
      a, b = s:find(pat, i)
      if a then
         table.insert(result, s:sub(i, a - 1))
         i = b + 1
      else
         table.insert(result, s:sub(i))
         break
      end
   end
   return result
end

function split_string(text)
   local lines = {}
   for _, w in ipairs(split(text, ' ')) do
      if #lines > 0 and w:len() + lines[#lines]:len() + 1 < config.text.width then
         lines[#lines] = lines[#lines] .. ' ' .. w
      else
         table.insert(lines, w)
      end
   end
   return lines
end

function game.load()

end

function game.clear_location()
	game.text = ""
	game.links = {
		text = {},
		location = {},
		commands = {},
	}
end

function game.draw_location()
	game.lines = split_string(game.text)
	for i = 1, #game.lines do
		love.graphics.print(game.lines[i], config.font.width, i * config.font.height)
	end
	for i = 1, #game.links.text do
		love.graphics.print(i..". "..game.links.text[i], config.font.width, (#game.lines + i + 1) * config.font.height)
	end
end

function game.next_location(location_id)
	game.clear_location()
	game.load_location(location_id)
end

function game.load_location(location_id)

end

function game.mousepressed(x, y)
	local line = 0
	for i = 1, 3 do
		if mouse_in_rect(x, y, config.font.width, 
			(#game.lines + i + 1) * config.font.height, 
			config.window.width - (config.font.width * 2), 
			config.font.height) then
			line = i
			break
		end
	end
	if line > 0 and line <= #game.links.text then
		game.next_location(game.links.location[line])
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
		game.next_location(game.links.location[line])
	end
end

return game