class_name DragTarget
extends Control

signal drag_data_dropped(data: Variant)


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	drag_data_dropped.emit(data)
