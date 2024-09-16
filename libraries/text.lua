local text = {}
local tm = {__index = text}

function text.new(text, x, y, font, c, onClick)
	onClick = onClick or false
	t = {
		text = text,
		font = font,
		x = x,
		y = y,
		h = font:getHeight(text),
		w = font:getWidth(text),
		c = c,
		onClick = onClick,
	}
	return setmetatable(t, tm)
end

function text:draw()
	echo(self.text, math.floor(self.x), math.floor(self.y), self.c)
end

function text:click()
	if pointInRect(love.mouse.getX(), love.mouse.getY(), self.x, self.y, self.w, self.h) then
		if self.onClick then
			if type(self.onClick) == "function" then
				self.onClick(self)
			end
		end
	end
end

return text