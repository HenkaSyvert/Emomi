extends Control

@export_file("*.tscn") var previous_scene_file_path: String

@onready var navigation_bar: NavigationBar = $Contents/Left/NavigationBar


func _ready() -> void:
	navigation_bar.previous_scene_file_path = previous_scene_file_path
