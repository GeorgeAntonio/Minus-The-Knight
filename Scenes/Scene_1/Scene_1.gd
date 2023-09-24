extends Scene

var level := load("res://Scenes/Scene_4/Scene_4.tscn")
var exit_1 : bool
var exit_2 : bool
var exit_3 : bool

func _ready():
	exit_1 = false
	exit_2 = false
	exit_3 = false
	if st_loc == 1:
		$CharacterBody2D.position = Vector2(251,-27)
	elif st_loc == 2:
		$CharacterBody2D.position = Vector2(249,-182)		
	elif st_loc == 3:
		$CharacterBody2D.position = Vector2(262,85)
	print(st_loc)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
	if(exit_1):
		emit_signal('next_level', level, 1)
	elif(exit_2):
		emit_signal('next_level', level, 2)
	elif(exit_3):
		emit_signal('next_level', level, 3)


func _on_s_1_body_entered(body): 
	exit_1 = true

func _on_s_2_body_entered(body):
	exit_2 = true

func _on_s_3_body_entered(body):
	exit_3 = true

func _on_water_body_entered(body):
	if(body.state != 4):
		body.hp = 0
