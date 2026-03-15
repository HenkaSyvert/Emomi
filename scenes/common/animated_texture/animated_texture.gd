extends TextureRect

@export var frames: Array[Texture2D]
@export var fps: float = 2

@onready var timer: Timer = $Timer
@onready var aspCorrect: AudioStreamPlayer2D = $aspCorrect
@onready var aspWrong: AudioStreamPlayer2D = $aspWrong
@export var correctSound: AudioStream
@export var wrongSound: AudioStream
@export var popup: PanelContainer

@export var wrong_frame: Texture2D = null

var current_frame: int = 0


func _ready() -> void:
	texture = frames[current_frame]
	timer.wait_time = 1.0 / fps

	aspCorrect.stream = correctSound
	aspWrong.stream = wrongSound


func _on_timer_timeout() -> void:
	current_frame = current_frame + 1
	current_frame = current_frame % frames.size()
	texture = frames[current_frame]


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var is_correct: bool = data as bool
	if is_correct:
		popup.visible = true
		if not SoundManager.is_muted:
			aspCorrect.play()
	else:
		if wrong_frame:
			texture = wrong_frame
		timer.stop()
		timer.start()
		if not SoundManager.is_muted:
			aspWrong.play()
