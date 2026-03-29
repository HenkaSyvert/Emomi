extends AudioStreamPlayer2D


func _ready() -> void:
	_connect_buttons_in_tree(get_tree().root)
	var error: Error = get_tree().connect("node_added", _try_connect_button)
	assert(error == OK)


func _connect_buttons_in_tree(root: Node) -> void:
	for child: Node in root.get_children():
		_try_connect_button(child)
		_connect_buttons_in_tree(child)


func _try_connect_button(node: Node) -> void:
	if node is BaseButton:
		var error: Error = node.connect("pressed", _on_button_pressed)
		assert(error == OK)


func _on_button_pressed() -> void:
	play()
