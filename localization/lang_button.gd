extends Button

@export var lang_icon: Node

@export var swe_icon: Resource
@export var es_icon: Resource
@export var eng_icon: Resource


func _ready() -> void:
	lang_icon.texture =es_icon
	


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
