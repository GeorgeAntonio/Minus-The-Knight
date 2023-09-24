extends CharacterBody2D


@export var SPEED = 300.0
@export var  JUMP_VELOCITY = -400.0
@export var state := 0 #Armed is default
@export var hp = 10

var direction
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func change_state(n:int):
	state = n

func _process(delta):
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

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	print(direction)
	if direction:
		velocity.x = direction * SPEED
		if(direction > 0):
			$Sprites/Armed.flip_h=false;
			$Sprites/Unarmed.flip_h=false;
			$Sprites/NoShield.flip_h=false;
			$Sprites/NoArmor.flip_h=false;
		if(direction < 0):
			$Sprites/Armed.flip_h=true;
			$Sprites/Unarmed.flip_h=true;
			$Sprites/NoShield.flip_h=true;
			$Sprites/NoArmor.flip_h=true;
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
#	#	

	move_and_slide()
