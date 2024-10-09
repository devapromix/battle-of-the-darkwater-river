config = {
	font = {
		width = 25,
		height = 35,
	},
	
	text = {
		width = 100,
	},
	
	debug = true,
	
	audio = {
		volume = 0.5,
	},
	
	game = {
		name = 'Битва у Темноводной Реки',
		version = '0.1',
	},
	
	gui = {
		scale = 4,
	}
}

window = {
	width = 1920,
	height = 1080,
	--width = 1280,
	--height = 800,
	fullscreen = true,
}

function love.conf (t)
	t.console = config.debug
	t.window.fullscreen = window.fullscreen
	t.window.msaa = 0
	t.window.fsaa = 0
	t.window.display = 1
	t.window.resizable = false
	t.window.vsync = false
	t.identity = 'BattleoftheDarkwaterRiver'..config.game.version
	t.window.title = config.game.name
	t.window.width = window.width
	t.window.height = window.height
	t.window.icon = "assets/icons/game.png"
end