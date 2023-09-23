extends CharacterBody2D

@export var target : CharacterBody2D
@export var speed := 50.0
@onready var animation = $AnimatedSprite2D
var waiting = true
var can_attack = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2(1,0)

signal attack()

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	
	if(!animation.is_playing()):
		animation.play('idle')
	if $RayCasting/Left.is_colliding():
		waiting = false
		follow_player(-1)
	if $RayCasting/Right.is_colliding():
		waiting = false
		follow_player(1)
	if(global_position.distance_to(target.global_position) > 500):
		velocity = Vector2.ZERO
	elif(global_position.distance_to(target.global_position) < 120):
		velocity = Vector2.ZERO
		if(can_attack):
			$AttackTimer.start()
			can_attack  = false
			emit_signal('attack')
			animation.play("attack")
	if(velocity.x > 0 && (global_position.distance_to(target.global_position) > 150)):
		animation.play("walking")
	move_and_slide()
	

func follow_player(dir):
	if dir == 1:
		animation.flip_h = false
	else:
		animation.flip_h = true
	if(global_position.distance_to(target.global_position) > 150):
		velocity = Vector2(dir,0) * speed
	


func _on_arena_door_area_entered(area):
	waiting = true
	follow_player(-1)


func _on_attack_timer_timeout():
	can_attack = true

