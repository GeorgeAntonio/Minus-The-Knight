class_name Scene extends Node2D

var game_over = load("res://Scenes/Game_Over/Game_Over.tscn")

signal next_level(level,x)

func _process(delta):
	if $CharacterBody2D.hp >=0 :
		emit_signal('next_level', game_over, -1) 
