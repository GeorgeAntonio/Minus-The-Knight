extends Scene

var level := load("res://Scenes/Scene_5/Scene_5.tscn")

var exit_1 : bool
var exit_2 : bool



func _ready():
	var exit_1 = false
	var exit_2 = false
	
	if st_loc == 16:
		$CharacterBody2D.position = Vector2(225,577)
	elif st_loc == 17:
		$CharacterBody2D.position = Vector2(101,196)
	

func _on_area_2d_body_entered(body):
	emit_signal("next_level", level, 13)


func _on_king_attack():
	if($CharacterBody2D.state == 2):
		$CharacterBody2D/Sprites/NoShield.play('break')


func _on_area_2d_2_body_entered(body):
	emit_signal("next_level", level, 12)


func _on_spikes_body_entered(body):
	if(body.state != 4):
		body.hp = 0
