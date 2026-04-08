extends MarginContainer

static var should_hide: bool = false


func _ready() -> void:
	visible = not should_hide


func _on_button_pressed() -> void:
	visible = false
	should_hide = true
