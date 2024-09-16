local game = {
	text = "",
	links = {},

	text = "Громкие завывания разочаровавшихся гоблинов ясно свидетельствуют о протесте, но Вы настаиваете на своем. Главный нарушитель спокойствия - гоблин по имени Черноглаз - бросает вызов вашему авторитету. Он заявляет о том, что они будут делать что хотят и никто им в этом не будет помехой. Некоторые гоблины начинают соглашаться с ним...",
	links = {
		text = {
			"1. Отступить и дать им свободу выбора...",
			"2. Попытаться убить Черноглаза из-за неповиновения...",
			},
		location = {},
	},

}

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
	game.links = {}
end

function game.draw_location()
	local lines = split_string(game.text)
	for i = 1, #lines do
		love.graphics.print(lines[i], config.font.width, i * config.font.height)
	end
	for i = 1, #game.links.text do
		love.graphics.print(game.links.text[i], config.font.width, (#lines + i + 1) * config.font.height)
	end
end

return game