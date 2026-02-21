extends Button

@export var scene: PackedScene
@export var unlocked_icon: Resource
@export var locked_icon: Resource

@onready var menu_root: Node = $/root/Game/LevelSelect
@onready var game: Node = $/root/Game


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if disabled:
		icon = locked_icon
	else:
		icon = unlocked_icon


func _on_pressed() -> void:
	if disabled:
		return
	var s: Node = scene.instantiate()
	game.add_child(s)
	menu_root.queue_free()
