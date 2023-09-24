extends Scene
var previous_cena = load("res://Scenes/Scene_3/Scene_3.tscn") 
var next_scene = load("res://Scenes/Scene_2/Scene_2.tscn") 


var exit_1 : bool
var exit_2 : bool
var exit_3 : bool
var exit_4 : bool



func _ready():
	var exit_1 = false
	var exit_2 = false
	var exit_3 = false
	var exit_4 = false
	if st_loc == 12:
		$CharacterBody2D.position = Vector2(953,386)
	elif st_loc == 13:
		$CharacterBody2D.position = Vector2(921,606)
	elif st_loc == 14:
		$CharacterBody2D.position = Vector2(109,610)
	elif st_loc == 15:
		$CharacterBody2D.position = Vector2(112,610)

func _on_area_2d_body_entered(body):
	emit_signal("next_level", previous_cena, 10)


func _on_area_2d_2_body_entered(body):
	emit_signal("next_level", next_scene, 17)


func _on_area_2d_3_body_entered(body):
	emit_signal("next_level", next_scene, 16)


func _on_area_2d_4_body_entered(body):
	body.hp = 0

func _on_area_2d_5_body_entered(body):
	emit_signal("next_level", previous_cena, 11)

