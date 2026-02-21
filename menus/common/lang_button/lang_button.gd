extends Button

@export var lang_icon: TextureRect

@export var swe_icon: Texture2D
@export var es_icon: Texture2D
@export var eng_icon: Texture2D


func _ready() -> void:
	lang_icon.texture = es_icon


func _on_pressed() -> void:
	if lang_icon.texture == es_icon:
		TranslationServer.set_locale("en")
		lang_icon.texture = eng_icon
	elif lang_icon.texture == eng_icon:
		TranslationServer.set_locale("sv")
		lang_icon.texture = swe_icon
	else:
		TranslationServer.set_locale("es")
		lang_icon.texture = es_icon
