extends PanelContainer


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
		"res://scenes/screens/levels/level_1/level_1.tscn"
	)
	assert(err == OK)


func _on_level_2_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/levels/level_2/level_2.tscn"
	)
	assert(err == OK)


func _on_level_3_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/levels/level_3_a/level_3a.tscn"
	)
	assert(err == OK)


func _on_rewards_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/rewards/rewards_menu.tscn"
	)
	assert(err == OK)
