extends Scene
var previous_cena := load("res://Scenes/Scene_4/Scene_4.tscn") 
var hidden_room := load("res://Scenes/Scene_3.5/Scene 3.5.tscn")
var next_room := load("res://Scenes/Scene_5/Scene_5.tscn")

#@onready var serra =$serra
#@onready var serra2 =$serra2

func _ready():
	if st_loc == 8:
		$CharacterBody2D.position = Vector2(62,565)
	elif st_loc == 9:
		$CharacterBody2D.position = Vector2(82,662)
	elif st_loc == 7:
		$CharacterBody2D.position = Vector2(-42,-74)
	elif st_loc == 10:
		$CharacterBody2D.position = Vector2(1278,565)
	elif st_loc == 11:
		$CharacterBody2D.position = Vector2(1288,670)
		
#func _on_e_2_body_entered(body):
#	emit_signal("next_level", previous_cena, 2)


func _on_e_1_body_entered(body):
	emit_signal("next_level", previous_cena, 5)


func _on_e_3_body_entered(body):
	emit_signal("next_level", next_room, 10)


func _on_area_2d_body_entered(body):
	emit_signal("next_level", next_room, 13)
	

func _on_saw_body_entered(body):
	body.hp = 0
