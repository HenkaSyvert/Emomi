extends Node2D

var level_1_complete: bool = false
var level_2_complete: bool = false


func _process(_delta: float) -> void:
	if Input.is_action_pressed(&"exit"):
		get_tree().quit()
