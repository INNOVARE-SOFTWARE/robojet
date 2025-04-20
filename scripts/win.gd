extends Node2D

func _ready():
	$Timer.start()

func _on_timer_timeout() -> void:
	if Global.scene == 2:
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
	if Global.scene == 3:
		get_tree().change_scene_to_file("res://scenes/level3.tscn")
