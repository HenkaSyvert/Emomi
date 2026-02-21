extends Button

@export var scene: PackedScene

@onready var game_node: Node = $/root/Game
@onready var menu_node: Control = $/root/Game/MainMenu


func _on_pressed() -> void:
	var s: Node = scene.instantiate()
	game_node.add_child(s)
	menu_node.queue_free()
