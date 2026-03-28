class_name ChangeLevelButton
extends TextureButton

@export_file("*.tscn") var scene_path: String


func _on_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(scene_path)
	assert(error == OK)
