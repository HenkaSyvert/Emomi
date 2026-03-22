extends PanelContainer

@export var next_scene: PackedScene
@export var is_end_of_level: bool = false
@export var level_index: int

@onready var label: Label = $VBoxContainer/Label2


func _ready():
	label.text = tr("POPUP2")
	if is_end_of_level:
		label.text += "\n" + tr("POPUP_REWARD")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(next_scene)
	Game.nr_of_stars += 1
	Engine.time_scale = 1
	if is_end_of_level:
		Game.completed_levels += 1
