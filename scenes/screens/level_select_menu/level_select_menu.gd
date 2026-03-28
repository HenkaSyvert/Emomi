extends Control


func _ready() -> void:
	var level_2_button: ChangeLevelButton = find_child("Level2Button")
	var level_3_button: ChangeLevelButton = find_child("Level3Button")
	level_2_button.disabled = not Game.nr_completed_levels >= 1
	level_3_button.disabled = not Game.nr_completed_levels >= 2
