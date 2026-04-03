extends PanelContainer

@onready var popup: PanelContainer = $MarginContainer/Popup
@onready var asp_correct: AudioStreamPlayer2D = $CorrectSound
@onready var asp_wrong: AudioStreamPlayer2D = $WrongSound


func _on_animated_texture_answered(is_correct: bool) -> void:
	if is_correct:
		asp_correct.play()
		var time: float = 1.0 / AnimatedTextureRect.FPS
		await get_tree().create_timer(time).timeout
		popup.visible = true
	else:
		asp_wrong.play()
