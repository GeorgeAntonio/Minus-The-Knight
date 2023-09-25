extends Scene


var level_b := load("res://Scenes/Scene_1/Scene_1.tscn")
var level_f := load("res://Scenes/Scene_3/Scene_3.tscn")
var level_s := load("res://Scenes/Scene_3.5/Scene 3.5.tscn")

var exit_1 : bool
var exit_2 : bool
var exit_3 : bool
var exit_4 : bool
var exit_5 : bool
var exit_6 : bool



func _ready():
	var exit_1 = false
	var exit_2 = false
	var exit_3 = false
	var exit_4 = false
	var exit_5 = false
	var exit_6 = false
	if st_loc == 1:
		$CharacterBody2D.position = Vector2(32,16)
	elif st_loc == 3:
		$CharacterBody2D.position = Vector2(41,540)
	elif st_loc == 2:
		$CharacterBody2D.position = Vector2(101,421)
	elif st_loc == 4:
		$CharacterBody2D.position = Vector2(3090,-123)
	elif st_loc == 5:
		$CharacterBody2D.position = Vector2(2995,418)
	elif st_loc == 6:
		$CharacterBody2D.position = Vector2(2904,556)


func _process(delta):
	super._process(delta)
	if(exit_1):
		emit_signal('next_level', level_b, 1)
	elif(exit_2):
		emit_signal('next_level', level_b, 2)
	elif(exit_3):
		emit_signal('next_level', level_s, 7)
	if(exit_4):
		emit_signal('next_level', level_f, 8)
	elif(exit_5):
		emit_signal('next_level', level_b, 5)
	elif(exit_6):
		emit_signal('next_level', level_f, 9)
	
		

func _on_exit_1_body_entered(body):
	exit_1 = true


func _on_exit_2_body_entered(body):
	exit_2 = true


func _on_exit_3_body_entered(body):
	exit_3 = true


func _on_exit_4_body_entered(body):
	exit_4 = true


func _on_exit_5_body_entered(body):
	exit_5 = true


func _on_exit_6_body_entered(body):
	exit_6 = true
