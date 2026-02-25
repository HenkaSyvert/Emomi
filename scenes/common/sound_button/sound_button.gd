extends TextureButton


func _on_pressed() -> void:
	SoundManager.is_muted = not SoundManager.is_muted
