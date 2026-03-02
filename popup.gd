extends AcceptDialog

@export var next_scene: PackedScene


func _on_confirmed() -> void:
	get_tree().change_scene_to_packed(next_scene)
