extends Node

var _prev_scene_path: String
var _home_scene_path: String


func _ready() -> void:
	_home_scene_path = get_tree().current_scene.scene_file_path


func change_scene(scene_path: StringName) -> void:
	if get_tree().current_scene:
		_prev_scene_path = get_tree().current_scene.scene_file_path
		get_tree().current_scene.queue_free()

	var scene: Node = (load(scene_path) as PackedScene).instantiate()
	get_tree().root.add_child(scene)
	get_tree().current_scene = scene


func load_previous_scene() -> void:
	change_scene(_prev_scene_path)


func load_home_scene() -> void:
	change_scene(_home_scene_path)
