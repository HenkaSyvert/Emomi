extends Button

@onready var p: AudioStreamPlayer2D = $/root/SoundManager/MusicPlayer


func _on_pressed() -> void:
	if p.playing:
		p.stop()
	else:
		p.play()
