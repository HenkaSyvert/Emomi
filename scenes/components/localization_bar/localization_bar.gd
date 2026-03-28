extends AspectRatioContainer

@export var language_flags: Array[Texture2D]

var locale_index: int = 1

@onready var language_icon: TextureRect = $HBoxContainer/LanguageIcon
@onready var locales: Array[String]


func _ready() -> void:
	locales.assign(
		TranslationServer.get_translations().map(func(t: Translation) -> String: return t.locale)
	)
	locale_index = locales.find(TranslationServer.get_locale())
	assert(locale_index != -1)
	language_icon.texture = language_flags[locale_index]


func _on_localization_button_pressed() -> void:
	locale_index += 1
	locale_index %= locales.size()

	var locale: String = locales[locale_index]
	TranslationServer.set_locale(locale)

	language_icon.texture = language_flags[locale_index]
