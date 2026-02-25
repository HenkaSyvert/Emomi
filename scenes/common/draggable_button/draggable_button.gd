extends Button


func _get_drag_data(_at_position: Vector2) -> Variant:
	var preview: Control = self.duplicate()
	preview.modulate.a = 0.7
	set_drag_preview(preview)
	return self


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	print("dropped", data.name)
