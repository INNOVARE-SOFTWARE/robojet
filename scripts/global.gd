extends Node

@export var life = 3
@export var scene = 1
@export var gold = 0

func finalizeScene()->void:
	scene = scene + 1
	gold = 0
	get_tree().change_scene_to_file("scenes/win.tscn")
