extends TextureButton


func _get_drag_data(at_position: Vector2) -> Variant:
	var preview: TextureButton = duplicate()
	preview.modulate.a = 0.5
	preview.size = size

	var control: Control = Control.new()
	control.add_child(preview)
	preview.position = Vector2.ZERO - at_position

	set_drag_preview(control)
	return self
