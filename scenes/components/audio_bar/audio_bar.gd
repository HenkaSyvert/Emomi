extends TextureButton

@export var texture_muted: Texture2D
@export var texture_unmuted: Texture2D


func _ready() -> void:
	texture_normal = texture_muted if AudioServer.is_bus_mute(0) else texture_unmuted


func _on_pressed() -> void:
	AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
	texture_normal = texture_muted if AudioServer.is_bus_mute(0) else texture_unmuted
