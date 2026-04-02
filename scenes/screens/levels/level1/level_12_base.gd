extends PanelContainer

@onready var char_info: Control = $MarginContainer/CharacterInfo
@onready var popup: PanelContainer = $MarginContainer/Popup


func _on_about_button_pressed() -> void:
	char_info.visible = true


func _on_animated_texture_answered(is_correct: bool) -> void:
	if is_correct:
		var time: float = 1.0 / AnimatedTextureRect.FPS
		await get_tree().create_timer(time).timeout
		popup.visible = true
