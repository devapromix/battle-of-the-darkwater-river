local font = {}

function font.load()
	font.mid = love.graphics.newFont("assets/fonts/Inconsolata-Bold.ttf", 45)
	font.default = font.mid
	love.graphics.setFont(font.default)
end

return font