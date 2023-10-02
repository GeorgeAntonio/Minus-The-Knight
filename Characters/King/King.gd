extends CharacterBody2D

@export var target : CharacterBody2D
@export var speed := 50.0
@onready var animation = $AnimatedSprite2D
var waiting = true
var hp = 10000
var can_attack = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2(1,0)

signal king_attack()

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
	elif(global_position.distance_to(target.global_position) < 120 && can_attack):
		velocity = Vector2.ZERO
		$AttackTimer.start()
		can_attack  = false
		emit_signal('king_attack')
		var att = randi_range(1,3)
		match att:
			1:
				animation.play("attack_1")
				
			2:
				animation.play("attack_2")
				
			3:
				animation.play("attack_3")
				
	if(position.x == 210 && waiting == true):
		velocity = Vector2.ZERO
		animation.flip_h = false
	if(velocity.x > 0 && (global_position.distance_to(target.global_position) > 150)):
		animation.play("walking")
	if(animation.animation == 'attack_1' && animation.frame == 2):
		$Att_1/SwordCollision1.disabled = false
	elif(animation.animation == 'attack_2' && animation.frame == 2):
		$Att_2/SwordCollision2.disabled = false
	elif(animation.animation == 'attack_3' && animation.frame == 2):
		$Att_3/SwordCollision3.disabled = false
	else:
		$Att_1/SwordCollision1.disabled = true
		$Att_2/SwordCollision2.disabled = true
		$Att_3/SwordCollision3.disabled = true
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


func _on_hitbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	animation.play('hurt')
	hp = hp -1
