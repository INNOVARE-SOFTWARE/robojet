extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	hide()
	$itemsprite/Area2D.queue_free()
	Global.gold = Global.gold + 1
	$sound.play()
