extends PanelContainer

@onready var level_2_button: TextureButton = $VBoxContainer/Bottom/HBoxContainer2/Level2Button
@onready var level_3_button: TextureButton = $VBoxContainer/Bottom/HBoxContainer2/Level3Button


func _ready() -> void:
	level_2_button.disabled = not Game.nr_completed_levels >= 1
	level_3_button.disabled = not Game.nr_completed_levels >= 2


func _on_home_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/main_menu/main_menu.tscn"
	)
	assert(error == OK)


func _on_return_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/main_menu/main_menu.tscn"
	)
	assert(error == OK)


func _on_level_1_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/levels/level1/eddy_dog.tscn"
	)
	assert(error == OK)


func _on_level_2_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/levels/level2/dog.tscn"
	)
	assert(error == OK)


func _on_level_3_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/levels/level3/eddy.tscn"
	)
	assert(error == OK)


func _on_rewards_button_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/rewards/rewards_menu.tscn"
	)
	assert(error == OK)
