extends Button

@onready var p = $"/root/Game/MusicPlayer"

func _on_pressed() -> void:
	if p.playing: p.stop()
	else: p.play()
