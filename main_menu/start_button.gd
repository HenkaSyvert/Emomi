extends Button


@export var scene: PackedScene

@onready var game_node = $/root/Game
@onready var menu_node = $/root/Game/MainMenu

func _on_pressed() -> void:
	var s = scene.instantiate()
	game_node.add_child(s)
	menu_node.queue_free()
