extends TextureButton
class_name AnimatedButton

@export var is_correct: bool = true
@export var frame_correct: Texture2D
@export var frame_wrong: Texture2D

@export var frames: Array[Texture2D]
@export var fps: int = 2
var current_frame: int = 0
@onready var timer: Timer = $Timer

var is_dragging: bool = false

@export var isLevel3: bool = false
@export var level3: Node


func _ready() -> void:
	timer.wait_time = 1.0 / fps
	texture_normal = frames[0]


func _get_drag_data(at_position: Vector2) -> Variant:
	is_dragging = true
	timer.stop()
	texture_normal = frame_correct if is_correct else frame_wrong
	var preview: AnimatedButton = duplicate()
	preview.modulate.a = 0.5
	preview.size = size
	preview.frames = [frame_correct if is_correct else frame_wrong]

	var control: Control = Control.new()
	control.add_child(preview)
	preview.position = Vector2.ZERO - at_position

	set_drag_preview(control)
	return is_correct


func _on_timer_timeout() -> void:
	current_frame += 1
	current_frame %= frames.size()
	texture_normal = frames[current_frame]


func _notification(what):
	if what == NOTIFICATION_DRAG_END and is_dragging:
		is_dragging = false
		timer.start()
		if get_window().gui_is_drag_successful() and isLevel3:
			var d = level3.new_opt(is_correct)
			frames = [d["texture"]]
			frame_correct = frames[0]
			frame_wrong = frames[0]
			is_correct = d["is_correct"]
			_on_timer_timeout()
