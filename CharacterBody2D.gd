extends CharacterBody2D

var game_over = load("res://Scenes/Game_Over/Game_Over.tscn")
@export var SPEED = 300.0
@export var  JUMP_VELOCITY = -400.0
@export var state := 0 #Armed is default
@export var hp = 10
signal attacking(state)
signal next_level()

var direction
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func connect_signals():
	if(get_parent().name == 'Scene_1'):
		self.king_attack.connect('on_king_attack')
		
func on_king_attack():
	change_state(3)
func change_state(n:int):
	state = n

func _process(delta):
	if(hp <= 0):
		emit_signal('next_level',game_over)
	if(velocity != Vector2.ZERO):
		for i in $Sprites.get_children():
			i.play('walking')
	else:
		for i in $Sprites.get_children():
			if(i.animation == 'walking'):
				i.play('idle')
	match state:
		1: 
			for i in $Sprites.get_children():
				if(i.name  != 'Armed'):
					i.hide()
				else:
					i.show()
					
		2:
			for i in $Sprite.get_children():
				if(i.name != 'NoShield'):
					i.hide()
				else:
					i.show()
		3:
			for i in $Sprites.get_children():
				if(i.name  != 'Unarmed'):
					i.hide()
				else:
					i.show()
		4:
			for i in $Sprites.get_children():
				if(i.name  != 'NoArmor'):
					i.hide()
				else:
					i.show()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#for i in $Sprites.get_children():
		#	i.play('jump')


	#Handle Attack
	if Input.is_action_just_pressed('left_click'):
		for i in $Sprites.get_children():
			i.play('attacking')
			emit_signal('attacking',state)
	#Handle Death
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if(direction > 0):
			for i in $Sprites.get_children():
				
				i.flip_h=false
		elif(direction < 0):
			for i in $Sprites.get_children():
				i.flip_h=true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
#	#	

	move_and_slide()


func _on_animation_finished():
	for i in $Sprites.get_children():
		i.play('idle')
