local mouse = {
	x = 0,
	y = 0,
}

function mouse.set_pos(x, y)
	mouse.x, mouse.y = x, y
end

function mouse.get_pos()
	return mouse.x, mouse.y
end

return mouse