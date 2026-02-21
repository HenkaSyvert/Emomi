extends Button

@onready var asp = $AudioStreamPlayer2D

func _on_pressed() -> void:
	if asp.playing: asp.stop()
	else: asp.play()
