extends Node2D

var level := load("res://Scenes/Scene_4/Scene_4.tscn")
signal next_level(level, x);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_s_1_body_entered(body): 
	emit_signal("next_level", level, 1)


func _on_s_2_body_entered(body):
	emit_signal("next_level", level, 2)


func _on_s_3_body_entered(body):
	emit_signal("next_level", level, 3)
