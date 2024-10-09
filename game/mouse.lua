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

function mouse.in_rect(left, top, width, height)
	local x, y = mouse.get_pos()
	return (x >= left) and (y >= top) and (x <= left + width) and (y <= top + height)
end

return mouse