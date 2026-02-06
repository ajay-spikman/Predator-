extends Node

var master_volume := 1.0
var music_volume := 1.0
var sfx_volume := 1.0


var resolution_index := 0
var window_mode_index := 0


func apply_audio():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(master_volume))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(music_volume))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(sfx_volume))

func apply_resolution():
	match resolution_index:
		0: DisplayServer.window_set_size(Vector2i(1920, 1080))
		1: DisplayServer.window_set_size(Vector2i(1600, 900))
		2: DisplayServer.window_set_size(Vector2i(1280, 720))

func apply_window_mode():
	match window_mode_index:
		0: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		1: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		2: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func apply_all():
	apply_audio()
	apply_resolution()
	apply_window_mode()

func save_settings():
	var config = ConfigFile.new()
	config.set_value("audio", "master", master_volume)
	config.set_value("audio", "music", music_volume)
	config.set_value("audio", "sfx", sfx_volume)
	config.set_value("video", "resolution", resolution_index)
	config.set_value("video", "window_mode", window_mode_index)
	config.save("user://settings.cfg")

func load_settings():
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		master_volume = config.get_value("audio", "amster", 1.0)
		music_volume = config.get_value("audio", "Music", 1.0)
		sfx_volume = config.get_value("audio", "SFX", 1.0)
		resolution_index = config.get_value("video", "resolution", 0)
		window_mode_index = config.get_value("video", "window_mode", 0)

func _ready():
	load_settings()
	apply_all()
