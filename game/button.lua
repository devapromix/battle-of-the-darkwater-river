local button = {}

function button:new(left, top, width, height, text, action, active, sound)
	local _left = left
	local _top = top
	local _width = width
	local _height = height
	local _text = text
	local _action = action
	local _active = active
	local _sound = sound
	local _scale = config.gui.scale
	
	current = {}
	
	local leftTop = love.graphics.newImage("assets/images/button/lefttop.png")	
	local rightTop = love.graphics.newImage("assets/images/button/righttop.png")	
	local leftBottom = love.graphics.newImage("assets/images/button/leftbottom.png")	
	local rightBottom = love.graphics.newImage("assets/images/button/rightbottom.png")	
	local topLine = love.graphics.newImage("assets/images/button/top.png")	
	local bottomLine = love.graphics.newImage("assets/images/button/bottom.png")	
	local leftLine = love.graphics.newImage("assets/images/button/left.png")	
	local rightLine = love.graphics.newImage("assets/images/button/right.png")	
	local default = love.graphics.newImage("assets/images/button/default.png")	
	local hover = love.graphics.newImage("assets/images/button/hover.png")	
	local dis = love.graphics.newImage("assets/images/button/dis.png")	

	local function draw(aimage)
		local x = _left + (_scale * 2)
		local y = _top + (_scale * 3)
		while y < _top + _height - (_scale * 3) do
			while x < _left + (_width - (_scale * 3)) do
				love.graphics.draw(aimage, x, y, 0, _scale)
				x = x + (_scale * 6)
			end	
			y = y + (_scale * 6)
			x = _left + (_scale * 2)
		end
	end

	current.draw = function()
		draw(default)
		if mouse.in_rect(left, top, width, height) then
			if love.mouse.isDown(1) then
				draw(default)
			else
				draw(hover)
			end
		end
		if not _active then
			draw(dis)
		end
		
		local x = _left + (_scale * 6)
		while x < _left + _width - (_scale * 6) do
			love.graphics.draw(topLine, x, _top, 0, _scale)
			love.graphics.draw(bottomLine, x, _top + _height - (_scale * 6), 0, _scale)
			x = x + (_scale * 6)
		end
		local y = _top + (_scale * 6)
		while y < _top + _height - (_scale * 6) do
			love.graphics.draw(leftLine, _left, y, 0, _scale)
			love.graphics.draw(rightLine, _left + _width - (_scale * 6), y, 0, _scale)
			y = y + (_scale * 6)
		end

		love.graphics.draw(leftTop, _left, _top, 0, _scale)
		love.graphics.draw(rightTop, _left + _width - (_scale * 6), _top, 0, _scale)
		love.graphics.draw(leftBottom, _left, _top + _height - (_scale * 6), 0, _scale)
		love.graphics.draw(rightBottom, _left + _width - (_scale * 6), _top + _height - (_scale * 6), 0, _scale)
		
		draw_centered_text(_left, _top, _width, _height, _text)
	end
	
	current.update = function()
		if mouse.in_rect(_left, _top, _width, _height) then
			if _active and _sound ~= nil then _sound:play() end
			_action()
		end
	end
	
	current.active = function(act)
		_active = act
	end

	return current
end

return button