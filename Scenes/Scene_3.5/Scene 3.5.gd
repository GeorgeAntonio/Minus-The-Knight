extends Scene

var previous_cena := load("res://Scenes/Scene_4/Scene_4.tscn")

# Called when the node enters the scene tree for the first time.

func _ready():
	if st_loc == 7:
		$CharacterBody2D.position = Vector2(-42,-74)

func _on_area_2d_body_entered(body):
	emit_signal("next_level",previous_cena,4)


func _on_wc_body_entered(body):
	body.state = 4


func _on_water_body_entered(body):
	if(body.state != 4):
		body.hp = 0
