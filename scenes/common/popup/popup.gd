extends PanelContainer

@export var next_scene: PackedScene

@onready var asp: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_confirmed() -> void:
	get_tree().change_scene_to_packed(next_scene)
	Game.nr_of_stars += 1
