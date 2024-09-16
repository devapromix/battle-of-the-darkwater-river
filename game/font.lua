local font = {}

function font.load()
	font.mid = love.graphics.newFont("assets/fonts/UbuntuMono-R.ttf", 35)
	font.default = font.mid
	love.graphics.setFont(font.default)
end

return font