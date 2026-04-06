@tool
class_name DraggableOption
extends Control

@export var is_correct: bool = true
@export var frames: Array[Texture2D]:
	set(value):
		frames = value
		_apply_properties()
@export var frame_correct: Texture2D
@export var frame_wrong: Texture2D

@export var is_level_3: bool = false
@export var level_3: Level3

@onready var _anim: AnimatedTextureRect = $AnimatedTextureRect
@onready var _drag_source: DragSource = $DragSource


func _apply_properties() -> void:
	if is_inside_tree() and has_node("AnimatedTextureRect"):
		_anim.frames = frames


func _ready() -> void:
	_apply_properties()
	_drag_source.drag_data = is_correct


func _on_drag_source_drag_started() -> void:
	_anim.stop()

	if is_correct:
		_anim.texture = frame_correct if frame_correct else frames[0]
	else:
		_anim.texture = frame_wrong if frame_wrong else frames[0]

	var drag_preview: TextureRect = TextureRect.new()
	drag_preview.texture = _anim.texture
	drag_preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	drag_preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
	_drag_source.drag_preview = drag_preview


func _on_drag_source_drag_stopped(is_successful: bool) -> void:
	_anim.play()
	if is_successful and is_level_3:
		var d: Dictionary = level_3.new_opt(is_correct)
		frames = [d["texture"]]
		_anim.frames = frames
		is_correct = d["is_correct"]
		_drag_source.drag_data = is_correct
