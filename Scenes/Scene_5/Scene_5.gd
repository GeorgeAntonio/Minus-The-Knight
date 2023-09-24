extends Scene
var previous_cena = load("res://Scenes/Scene_3/Scene_3.tscn") 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	emit_signal("next_level", previous_cena, 1)
	

func espinhos(body):
	body.hp = 0


func _on_area_2d_2_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_3_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_4_body_entered(body):
	pass # Replace with function body.
