extends StaticBody2D
var can_shoot := false
var id = 0
var flecha = preload("res://Scenes/Flecha/Flecha_2.tscn")

func _process(delta):
	if(can_shoot):
		var arrow_instance = flecha.instantiate()
		arrow_instance.global_position = $Marker2D.global_position
		self.get_tree().get_root().add_child(arrow_instance)
		can_shoot = false

func _on_timer_timeout():
	can_shoot = true

