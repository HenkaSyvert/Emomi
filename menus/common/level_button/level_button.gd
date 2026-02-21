extends Button

@export var to_create: PackedScene
@export var to_delete: Node

@export var unlocked_icon: Texture2D
@export var locked_icon: Texture2D

@onready var game_node: Node = $/root/Game


func _ready() -> void:
	if disabled:
		icon = locked_icon
	else:
		icon = unlocked_icon


func _on_pressed() -> void:
	var n: Node = to_create.instantiate()
	game_node.add_child(n)
	to_delete.queue_free()
