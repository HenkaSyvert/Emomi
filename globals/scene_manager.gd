extends Node


func change_scene(scene_path: StringName) -> void:
	if get_tree().current_scene:
		get_tree().current_scene.queue_free()

	var scene: Node = (load(scene_path) as PackedScene).instantiate()
	get_tree().root.add_child(scene)
	get_tree().current_scene = scene
