local state = {}

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
end

function state.keypressed(key, unicode)
	game.keypressed(key)
	if key == "escape" then
		state.hide()
	end
end

function state.mousepressed(x, y, button, istouch, presses)
	game.mousepressed(x, y)
end

return state