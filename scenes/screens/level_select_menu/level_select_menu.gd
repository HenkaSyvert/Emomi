extends PanelContainer

@onready var level2Button: TextureButton = $VBoxContainer/Bottom/HBoxContainer2/Level2Button
@onready var level3Button: TextureButton = $VBoxContainer/Bottom/HBoxContainer2/Level3Button


func _ready():
	level2Button.disabled = !Game.level_1_complete
	level3Button.disabled = !Game.level_2_complete


func _on_home_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/main_menu/main_menu.tscn"
	)
	assert(err == OK)


func _on_return_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/main_menu/main_menu.tscn"
	)
	assert(err == OK)


func _on_level_1_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/levels/level1/level_1/level_1.tscn"
	)
	assert(err == OK)


func _on_level_2_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/levels/level2/level_2/level_2.tscn"
	)
	assert(err == OK)


func _on_level_3_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/levels/level3/level_3_a/level_3a.tscn"
	)
	assert(err == OK)


func _on_rewards_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/rewards/rewards_menu.tscn"
	)
	assert(err == OK)
