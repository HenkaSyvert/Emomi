class_name NavigationBar
extends AspectRatioContainer

@export_file("*.tscn") var previous_scene_file_path: String:
	set(value):
		previous_scene_file_path = value
		if not is_inside_tree():
			await ready
		return_button.scene_path = previous_scene_file_path

@onready var return_button: ChangeLevelButton = $HBoxContainer/ReturnButton
