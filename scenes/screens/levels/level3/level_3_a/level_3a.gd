extends PanelContainer

@export var reizy: Array[Texture2D]
var angry_level: int = 3
@onready
var anim: AnimatedSprite2D = $"HBoxContainer/Middle/SubViewportContainer/SubViewport/AnimatedSprite2D"

@export var opt_buttons: Array[Button]


func _ready() -> void:
	check_angry()


func check_angry() -> void:
	match angry_level:
		0:
			print("win")
		1:
			anim.animation = &"angry_1"
		2:
			anim.animation = &"angry_2"
		3:
			anim.animation = &"angry_3"
		_:
			get_tree().quit(1)


func _on_home_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/main_menu/main_menu.tscn"
	)
	assert(err == OK)


func _on_return_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/level_select_menu/level_select_menu.tscn"
	)
	assert(err == OK)
