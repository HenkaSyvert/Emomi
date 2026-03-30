class_name NavigationBar
extends AspectRatioContainer

@export_file("*.tscn") var previous_scene_file_path: String

@onready var return_button: ChangeLevelButton = $HBoxContainer/ReturnButton


func _ready() -> void:
	return_button.scene_path = previous_scene_file_path
