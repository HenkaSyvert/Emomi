class_name AnimatedTextureRect
extends TextureRect

const FPS: int = 2

@export var frames: Array[Texture2D]:
	set(value):
		frames = value
		if frames:
			texture = frames[_current_frame_index]

var _current_frame_index: int = 0
var _is_playing: bool = true
var _time_left: float = 1.0 / FPS


func stop() -> void:
	_is_playing = false
	_time_left = 1.0 / FPS


func pause() -> void:
	_is_playing = false


func play() -> void:
	_is_playing = true


func _process(delta: float) -> void:
	if _is_playing and frames:
		_time_left -= delta
		if _time_left < 0:
			_time_left = 1.0 / FPS
			_current_frame_index += 1
			_current_frame_index %= frames.size()
			texture = frames[_current_frame_index]
