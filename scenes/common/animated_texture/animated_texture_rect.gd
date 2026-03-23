class_name AnimatedTextureRect
extends TextureRect

@export var frames: Array[Texture2D]
@export var wrong_frame: Texture2D = null
@export var fps: float = 2

@export var correct_sound: AudioStream
@export var wrong_sound: AudioStream
@export var popup: PanelContainer

@export var is_level_3: bool = false
@export var anger_level: int = 1
@export var max_anger_level: int = 1

var actual_frames: Array[Texture2D]
var all_frames: Array[Texture2D]
var current_frame: int = 0

@onready var timer: Timer = $Timer
@onready var asp_correct: AudioStreamPlayer2D = $AspCorrect
@onready var asp_wrong: AudioStreamPlayer2D = $AspWrong


func _ready() -> void:
	if is_level_3:
		all_frames = frames
		actual_frames = [all_frames[anger_level], all_frames[anger_level - 1]]
		frames = actual_frames

	texture = frames[current_frame]
	timer.wait_time = 1.0 / fps

	asp_correct.stream = correct_sound
	asp_wrong.stream = wrong_sound


func _on_timer_timeout() -> void:
	current_frame = current_frame + 1
	current_frame = current_frame % frames.size()
	texture = frames[current_frame]


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var is_correct: bool
	if data is bool:
		is_correct = data

	if is_correct:
		anger_level -= 1
		if anger_level == 0:
			popup.visible = true
			Engine.time_scale = 0
		if is_level_3:
			frames = [all_frames[anger_level], all_frames[anger_level - 1]]

		if not SoundManager.is_muted:
			asp_correct.play()

	else:
		anger_level += 1
		anger_level = min(anger_level, max_anger_level)

		if is_level_3:
			frames = [all_frames[anger_level], all_frames[anger_level - 1]]

		if wrong_frame:
			texture = wrong_frame
		timer.stop()
		timer.start()
		if not SoundManager.is_muted:
			asp_wrong.play()
