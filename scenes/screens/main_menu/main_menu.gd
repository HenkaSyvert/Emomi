extends PanelContainer


func _on_start_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/level_select_menu/level_select_menu.tscn"
	)
	assert(err == OK)
