extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	$portal.play("open")
	$Timer.start()


func _on_timer_timeout() -> void:
	Global.finalizeScene()
