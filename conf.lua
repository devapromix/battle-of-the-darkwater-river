config = {
	window = {
		width = 1100,
		height = 600,
		fullscreen = false,
	},
	
	debug = true,
	
	audio = {
		volume = 0.5,
	},
	
	game = {
		name = 'Битва у Темноводной Реки',
		version = '0.1',
	}
}


function love.conf (t)
	t.console = config.debug
	t.window.fullscreen = config.window.fullscreen
	t.window.msaa = 0
	t.window.fsaa = 0
	t.window.display = 1
	t.window.resizable = false
	t.window.vsync = false
	t.identity = 'BattleoftheDarkwaterRiver'..config.game.version
	t.window.title = config.game.name
	t.window.width = config.window.width
	t.window.height = config.window.height
	t.window.icon = "assets/icons/game.png"
end