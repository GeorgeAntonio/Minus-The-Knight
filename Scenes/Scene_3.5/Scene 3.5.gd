extends Scene

var previous_cena := load("res://Scenes/Scene_4/Scene_4.tscn")

# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.

func _on_area_2d_body_entered(body):
	emit_signal("next_level",previous_cena,1)
