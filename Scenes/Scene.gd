class_name Scene extends Node2D

var game_over = load("res://Scenes/Main_Menu/Main_Menu.tscn")
var ded :=false
var st_loc = -1

signal next_level(level,x)
signal battle(target,dmg)

func _process(delta):
	if($CharacterBody2D.hp<=0):
		emit_signal('next_level', game_over, -1) 
