require "import"

function love.load(args)
	math.randomseed(os.time())
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setVSync(1)
	timer = libtimer()
	
	states.setup()
	states.switch("menu")
	states.enter()
end

function love.draw()
	states.draw()
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



