local state = {}

local buttons = {}

table.insert(buttons, button:new(10, 10, 210, 70, 'new game', function()  end, true))

function state.hide()
	timer:after(0.25, function()
		
	end)
end

function state.enter()

end

function state.update(dt)

end

function state.draw()
	game.draw_location()
	for i = 1, #buttons do buttons[i].draw() end
end

function state.keypressed(key, unicode)
	game.keypressed(key)
	if key == "escape" then
		state.hide()
	end
end

function state.mousepressed(x, y, button, istouch, presses)
	game.mousepressed(x, y)
	for i = 1, #buttons do buttons[i].update() end
end

return state