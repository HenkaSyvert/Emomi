extends Node

var nr_completed_levels: int = 0
var nr_of_stars: int = 0


func _process(_delta: float) -> void:
	if Input.is_action_pressed(&"exit"):
		get_tree().quit()
