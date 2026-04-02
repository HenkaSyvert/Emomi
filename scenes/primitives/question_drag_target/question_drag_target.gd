@tool
class_name QuestionDragTarget
extends Control

signal answered(is_correct: bool)

@export var frames: Array[Texture2D]
@export var wrong_frame: Texture2D
@export var correct_frame: Texture2D

@onready var _anim: AnimatedTextureRect


func _ready() -> void:
	_anim = find_child("AnimatedTextureRect")
	_anim.frames = frames


func _on_drag_target_drag_data_dropped(data: Variant) -> void:
	if data is bool:
		var is_correct: bool = data

		if is_correct and correct_frame:
			_anim.stop()
			_anim.play()
			_anim.texture = correct_frame

		if not is_correct and wrong_frame:
			_anim.stop()
			_anim.play()
			_anim.texture = wrong_frame

		answered.emit(is_correct)
