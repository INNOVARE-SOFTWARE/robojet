extends ColorRect

func _process(delta: float) -> void:
	$lives.text = str(Global.life)
	
