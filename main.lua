require "import"

function love.load(args)
	math.randomseed(os.time())
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setVSync(1)
	timer = libtimer()
	
	font.load()
	game.load()
	
	states.setup()
	states.switch("menu")
	states.enter()
end

function love.draw()
	love.graphics.push()
	local sx = love.graphics.getPixelWidth() / window.width
	local sy = love.graphics.getPixelHeight() / window.height
	love.graphics.scale(sx, sy)
	local mx, my = love.mouse.getPosition()
	mouse.set_pos(mx / sx, my / sy)
	states.draw()
	love.graphics.pop()
end

function love.update(dt)
	states.update(dt)
	timer:update(dt)
end

function love.keypressed(key, unicode) 
	states.keypressed(key, unicode)
end

function love.mousepressed(x, y, button, istouch, presses) 
	states.mousepressed(x, y, button, istouch, presses)
end



