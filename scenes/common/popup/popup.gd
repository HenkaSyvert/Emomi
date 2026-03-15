extends PanelContainer

@export var next_scene: PackedScene


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(next_scene)
	Game.nr_of_stars += 1
