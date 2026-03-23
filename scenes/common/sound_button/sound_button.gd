extends TextureButton

@export var muted_texture: Texture2D
@export var not_muted_texture: Texture2D


func _ready() -> void:
	texture_normal = muted_texture if SoundManager.is_muted else not_muted_texture


func _on_pressed() -> void:
	SoundManager.is_muted = not SoundManager.is_muted
	texture_normal = muted_texture if SoundManager.is_muted else not_muted_texture
