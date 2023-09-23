extends Control
@onready var opt = $Options
@onready var Video = $Video
@onready var Audio = $Audio
@onready var Acessibility = $Acessibility

@onready var v_master = $Audio/AudioContainer/Master
@onready var v_music = $Audio/AudioContainer/Music
@onready var v_sfx = $Audio/AudioContainer/SFX

@onready var fscreen = $Video/VideoContainer/Fullscreen
@onready var borderless = $Video/VideoContainer/Borderless
@onready var vsync = $Video/VideoContainer/VSync


signal menu()
signal quit()

func _ready():
		v_master.value = db_to_linear(AudioServer.get_bus_volume_db(0))
		v_music.value = db_to_linear(AudioServer.get_bus_volume_db(1))
		v_sfx.value = db_to_linear(AudioServer.get_bus_volume_db(2))

func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)


func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		toggle()
		
func toggle():
	visible = !visible
	get_tree().paused = visible



func show_and_hide(first,second):
	first.show()
	second.hide()
	
func _on_exit_pressed():
	get_tree().quit()


func _on_video_pressed():
	show_and_hide(Video,opt)


func _on_audio_pressed():
	show_and_hide(Audio,opt)

func _on_accessibility_pressed():
	show_and_hide(Acessibility,opt)

func _on_back_from_options_pressed():
	if(get_parent().name == "CanvasLayer"):
		get_parent().get_parent().paused = false
		get_tree().paused = false
		queue_free()
	else:
		emit_signal("back_menu")


func _on_fullscreen_toggled(button_pressed):
	if(button_pressed):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func _on_borderless_toggled(button_pressed):
	if(button_pressed):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func _on_v_sync_toggled(button_pressed):
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)


func _on_back_from_video_pressed():
	show_and_hide(opt,Video)


func _on_master_value_changed(value):
	volume(0,value)
	

func volume(bus_index,value):
	AudioServer.set_bus_volume_db(bus_index,linear_to_db(value))


func _on_music_value_changed(value):
	volume(1,value)


func _on_sound_fx_value_changed(value):
	volume(2,value)


func _on_back_from_audio_pressed():
	show_and_hide(opt,Audio)
	

 
func _on_back_to_menu_pressed():
	var scene_controller = get_tree().current_scene
	menu.connect(scene_controller.menu)
	get_parent().get_parent().paused = false
	get_tree().paused = false
	emit_signal("menu")
	


func _on_back_from_access_pressed():
	show_and_hide(opt,Acessibility)
