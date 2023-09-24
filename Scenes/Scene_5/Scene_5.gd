extends Node2D
var prox_cena = load("res://Scenes/Game_Over/Game_Over.tscn") 

signal troca_cena(cena)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func troca():
	emit_signal('troca_cena',prox_cena)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
