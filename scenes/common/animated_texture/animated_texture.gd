extends TextureRect

@export var frames: Array[Texture2D]
@export var fps: float = 2

@onready var timer: Timer = $Timer

var current_frame: int = 0


func _ready() -> void:
	texture = frames[current_frame]
	timer.wait_time = 1.0 / fps


func _on_timer_timeout() -> void:
	current_frame = current_frame + 1
	current_frame = current_frame % frames.size()
	texture = frames[current_frame]
