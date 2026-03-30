extends Control

@export_file("*.tscn") var previous_scene_file_path: String:
	set(value):
		previous_scene_file_path = value
		if not is_inside_tree():
			await ready
		navigation_bar.previous_scene_file_path = previous_scene_file_path

@onready var navigation_bar: NavigationBar = $Contents/Left/NavigationBar
