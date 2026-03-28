extends HBoxContainer

@export_file("*.tscn") var previous_scene_file_path: String

@onready var return_button: ChangeLevelButton = $ReturnButton


func _ready() -> void:
	return_button.scene_path = previous_scene_file_path
