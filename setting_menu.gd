extends Control

func _ready():
	$"Panel2/Slider Master".value = Settings.master_volume
	$"Panel2/Slider Music".value = Settings.music_volume
	$"Panel2/Slider Sounds FX".value = Settings.sfx_volume


func _on_Slider_Master_value_changed(value):
	Settings.master_volume = value
	Settings.apply_audio()
	Settings.save_settings()

func _on_Slider_Music_value_changed(value):
	Settings.music_volume = value
	Settings.apply_audio()
	Settings.save_settings()

func _on_Slider_Sound_FX_value_changed(value):
	Settings.sfx_volume = value
	Settings.apply_audio()
	Settings.save_settings()


func _on_resolutions_item_selected(index):
	Settings.resolution_index = index
	Settings.apply_resolution()
	Settings.save_settings()


func _on_display_mode_item_selected(index):
	Settings.window_mode_index = index
	Settings.apply_window_mode()
	Settings.save_settings()

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Predators Game/predators_main_menu.scn")
