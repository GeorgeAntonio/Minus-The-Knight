extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var state := 0 #Armed is default

var direction
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
	if direction:
		velocity.x = direction * SPEED
		if(direction > 0):
			$Sprites/Armed.flip_h=true;
			$Sprites/Unarmed.flip_h=true;
			$Sprites/NoShield.flip_h=true;
			$Sprites/NoArmor.flip_h=true;
		if(direction<0):
			$Sprites/Armed.flip_h=false;
			$Sprites/Unarmed.flip_h=false;
			$Sprites/NoShield.flip_h=false;
			$Sprites/NoArmor.flip_h=false;
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
#	#	

	move_and_slide()
