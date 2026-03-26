class_name DragSource
extends Control

signal drag_started
signal drag_stopped(is_successful: bool)

@export var drag_data: Variant
@export var drag_preview: TextureRect

var _is_dragging: bool = false


func _get_drag_data(at_position: Vector2) -> Variant:
	if not _is_dragging:
		drag_started.emit()
	_is_dragging = true

	if drag_preview:
		drag_preview.modulate.a = 0.5
		drag_preview.set_anchors_and_offsets_preset(PRESET_CENTER)
		drag_preview.size = size

		var control: Control = Control.new()
		control.add_child(drag_preview)
		drag_preview.position = Vector2.ZERO - at_position

		set_drag_preview(control)

	return drag_data


func _notification(what: int) -> void:
	if what == NOTIFICATION_DRAG_END and _is_dragging:
		_is_dragging = false
		drag_stopped.emit(get_window().gui_is_drag_successful())
