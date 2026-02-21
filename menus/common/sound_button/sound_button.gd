extends Button

@onready var p: AudioStreamPlayer2D = $"/root/Game/MusicPlayer"


func _on_pressed() -> void:
	if p.playing:
		p.stop()
	else:
		p.play()
