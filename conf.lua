config = {
	font = {
		width = 20,
		height = 30,
	},
	
	text = {
		width = 73,
	},
	
	panel = {
		left = 1340,
	},
	
	image = {
		height = 600,
	},
	
	inventory = {
		max_slots = 10,
	},
	
	debug = true,
	
	audio = {
		volume = 0.5,
	},
	
	game = {
		name = 'LotBD',
		version = '0.1',
	},
	
	gui = {
		scale = 4,
	}
}

window = {
	width = 1920,
	height = 1080,
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
	t.identity = "LegendOfTheBlackDragon"
	t.window.title = config.game.name
	t.window.width = window.width
	t.window.height = window.height
	t.window.icon = "assets/icons/game.png"
end