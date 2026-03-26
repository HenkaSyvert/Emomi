class_name AnimatedButton
extends Control

@export var is_correct: bool = true
@export var frames: Array[Texture2D]
@export var frame_correct: Texture2D
@export var frame_wrong: Texture2D

@export var is_level_3: bool = false
@export var level_3: Level3

@onready var _anim: AnimTemp = $AnimTemp

var _is_dragging: bool = false


func _ready() -> void:
	_anim.frames = frames


func _get_drag_data(at_position: Vector2) -> Variant:
	_is_dragging = true

	_anim.stop()
	if is_correct:
		_anim.texture = frame_correct if frame_correct else frames[0]
	else:
		_anim.texture = frame_wrong if frame_wrong else frames[0]

	var preview: TextureRect = TextureRect.new()
	preview.texture = _anim.texture
	preview.modulate.a = 0.5
	preview.size = size

	var control: Control = Control.new()
	control.add_child(preview)
	preview.position = Vector2.ZERO - at_position

	set_drag_preview(control)
	return is_correct


func _notification(what: int) -> void:
	if what == NOTIFICATION_DRAG_END and _is_dragging:
		_is_dragging = false
		_anim.play()
		if get_window().gui_is_drag_successful() and is_level_3:
			var d: Dictionary = level_3.new_opt(is_correct)
			frames = [d["texture"]]
			_anim.frames = frames
			is_correct = d["is_correct"]
