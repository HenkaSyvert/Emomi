extends Button

@export var scene_path: StringName
@export var unlocked_icon: Texture2D
@export var locked_icon: Texture2D


func _ready() -> void:
	if disabled:
		icon = locked_icon
	else:
		icon = unlocked_icon


func _on_pressed() -> void:
	SceneManager.change_scene(scene_path)
