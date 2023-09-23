extends Node

@onready var current_level := $Main_Menu

var reload := false

func _ready():
	var settings = load("res://Scenes/Settings/Settings.tscn").instantiate()
	settings._ready()
	connect_signals()
	

func connect_signals():
	if(current_level == $Game_Over):
		current_level.menu.connect(_on_menu)
		current_level.quit.connect(_on_quit)
	elif(current_level == $Main_Menu):
		current_level.new_game.connect(_on_new_game)
		current_level.settings.connect(_on_settings)
		current_level.quit.connect(_on_quit)
	elif(current_level == $Settings):
		current_level.menu.connect(_on_menu)
	elif(current_level == $Level_Clear):
		current_level.next_level.connect(_on_next_level)
		
	
	


func _on_next_level(level):
	var next_level = level.instantiate()
	change_level(next_level)

func _on_new_game():
	var next_level = load("res://Scenes/Scene_1/Scene_1.tscn").instantiate()
	change_level(next_level)
	
func _on_level_clear(level):
	pass
	#var next_level = load("res://Scenes/UIs/Level_Clear/Level_Clear.tscn").instantiate()
	#next_level.level = level
	#change_level(next_level)
	

func _on_settings():
	var next_level = load("res://Scenes/Settings/Settings.tscn").instantiate()
	change_level(next_level)

func _on_quit():
	get_tree().quit()
	pass	

func _on_menu():
	var next_level = load("res://Scenes/Main_Menu/Main_Menu.tscn").instantiate()
	change_level(next_level)
	
func change_level(next_level):
	pass
	add_child(next_level)
	current_level.queue_free()
	current_level = next_level 
	connect_signals()
	
	
