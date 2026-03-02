extends TextureRect

@export var frames: Array[Texture2D]
@export var fps: float = 2

@onready var timer: Timer = $Timer

@onready var popup = preload("res://popup.tscn")

var current_frame: int = 0


func _ready() -> void:
	texture = frames[current_frame]
	timer.wait_time = 1.0 / fps


func _on_timer_timeout() -> void:
	current_frame = current_frame + 1
	current_frame = current_frame % frames.size()
	texture = frames[current_frame]


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var value: int = data as int

	if value == 1:
		$"../../../../Popup".visible = true
		$"../../../../AudioStreamPlayer2D2".play()

	else:
		$"../../../../AudioStreamPlayer2D".play()
