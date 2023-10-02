extends CharacterBody2D

@onready var animation = $AnimationPlayer
@export var speed := 50
@export var hp := 5
var target
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var dir : int
var can_attack := true
var state := 1

func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()

func _process(delta):
	match state:
		
		#IDLE
		1:
			velocity.x = 0
			animation_queue('idle')
			
		#FOLLOW PLAYER
		2:
			dir = 1 if target.x > position.x else -1
			velocity.x = dir * speed
			face_player()
			animation.play('walking')
			if(position.distance_to(target) < 50):
				state = 3
		#ATTACK
		3:
			velocity.x = 0
			attack()
			state = 4
			
		#DEFEND
		4:
			defend()
			if(can_attack):
				var att_chance = randi_range(1,5)
				if(att_chance == 1):
					state = 3
		
		#SEARCHING
		5:
			pass
			
		#DEAD
		6:
			if(animation.current_animation != 'death'):
				animation.play('death')
			
	target = get_target()
	if(target && position.distance_to(target) >= 150):
		state = 2
	elif(!target):
		state = 1
	if(hp <= 0):
		state = 6

func get_target():
	for i in $RayCasting.get_children():
		if(i.get_collider() is Player):
			return i.get_collider().global_position
	return

func face_player():
	if(target.x > position.x && scale.y == -1):
		scale.y = 1
		rotation_degrees = 0
	elif(target.x < position.x && scale.y == 1):
		scale.y = -1
		rotation_degrees = 180

func attack():
	if(can_attack):
		animation_queue('attack')
		can_attack = false
		$AttackTimer.start()

func defend():
	animation_queue('shield')

func animation_queue(anim):
	if(anim not in animation.get_queue()):
		animation.queue(anim)

func _on_attack_timer_timeout():
	can_attack = true


func _on_search_timer_timeout():
	state = 1
		
func _on_hitbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	animation.play('hurt')
	hp = hp -1


func _on_animation_player_animation_finished(anim_name):
	if(anim_name == 'death'):
		queue_free()
