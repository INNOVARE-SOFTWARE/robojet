extends Node2D
var gate = preload("res://prefabs/gate.tscn")

func _ready() -> void:
	Global.gold = 0

func _process(delta: float) -> void:
	if (Global.gold == 9):
		var node = gate.instantiate()
		node.set_position(Vector2(720,50))
		$cavern.add_child(node) #wall es el tileset
