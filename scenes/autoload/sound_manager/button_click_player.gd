extends AudioStreamPlayer2D


func _ready() -> void:
	# when _ready is called, there might already be nodes in the tree, so connect all existing buttons
	connect_buttons(get_tree().root)
	var error: Error = get_tree().connect("node_added", _on_scene_tree_node_added)
	assert(error == OK)


func _on_scene_tree_node_added(node: Node) -> void:
	if node is BaseButton:
		connect_to_button(node as BaseButton)


# recursively connect all buttons
func connect_buttons(root: Node) -> void:
	for child: Node in root.get_children():
		if child is BaseButton:
			connect_to_button(child as BaseButton)
		connect_buttons(child)


func connect_to_button(button: BaseButton) -> void:
	var error: Error = button.connect("pressed", _on_button_pressed)
	assert(error == OK)


func _on_button_pressed() -> void:
	if not (SoundManager as SoundManager).is_muted:
		play()
