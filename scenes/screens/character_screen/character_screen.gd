@tool
class_name CharacterScreen
extends Control

enum Character { EDDY, REIZY, MAKTY }
@export var character: Character = Character.EDDY:
	set(value):
		character = value
		_apply_properties()

@export var eddy_frames: Array[Texture2D]
@export var reizy_frames: Array[Texture2D]
@export var makty_frames: Array[Texture2D]
@export var eddy_button: Texture2D
@export var reizy_button: Texture2D
@export var makty_button: Texture2D
@export var buttons: Array[TextureButton]
@export var char_name: Label
@export var emotion_label: Label
@export var eddy_style: StyleBox
@export var reizy_style: StyleBox
@export var makty_style: StyleBox

@export var popup: PanelContainer
var popup_title: Label
var popup_text: Label
var _anim: AnimatedTextureRect


func _apply_properties() -> void:
	if is_inside_tree() and _anim:
		emotion_label.text = tr("info." + str(Character.keys()[character]).to_lower() + ".emotion")
		if character == Character.EDDY:
			_anim.frames = eddy_frames
			char_name.text = "Eddy"
			char_name.add_theme_color_override("font_color", Color("#1ABCE8"))
			var sb: StyleBoxFlat = popup.get_theme_stylebox("normal").duplicate()
			sb.border_color = Color("#1ABCE8")
			popup.add_theme_stylebox_override("normal", sb)
			for b: TextureButton in buttons:
				b.texture_normal = eddy_button
				b.texture_hover = eddy_button
				b.texture_pressed = eddy_button
		elif character == Character.REIZY:
			_anim.frames = reizy_frames
			char_name.text = "Reizy"
			char_name.add_theme_color_override("font_color", Color("#D84A3A"))
			var sb: StyleBoxFlat = popup.get_theme_stylebox("normal").duplicate()
			sb.border_color = Color("#D84A3A")
			popup.add_theme_stylebox_override("normal", sb)
			for b: TextureButton in buttons:
				b.texture_normal = reizy_button
				b.texture_hover = reizy_button
				b.texture_pressed = reizy_button
		else:
			_anim.frames = makty_frames
			char_name.text = "Makty"
			char_name.add_theme_color_override("font_color", Color("#FDAD1F"))
			popup.add_theme_stylebox_override("normal", makty_style)
			for b: TextureButton in buttons:
				b.texture_normal = makty_button
				b.texture_hover = makty_button
				b.texture_pressed = makty_button


func _ready() -> void:
	popup_title = find_child("PopupTitleLabel")
	popup_text = find_child("PopupTextLabel")
	_anim = find_child("AnimatedTextureRect")
	_apply_properties()


func _on_close_button_pressed() -> void:
	visible = false


func _on_close_popup_button_pressed() -> void:
	popup.visible = false


func _prepare_popup(title: String) -> void:
	if popup.visible:
		return

	popup_title.text = tr("info." + title)
	popup_text.text = tr("info." + str(Character.keys()[character]).to_lower() + "." + title)
	popup.visible = true


func _on_personality_pressed() -> void:
	_prepare_popup("personality")


func _on_likes_pressed() -> void:
	_prepare_popup("likes")


func _on_dislikes_pressed() -> void:
	_prepare_popup("dislikes")


func _on_fav_food_pressed() -> void:
	_prepare_popup("fav_food")


func _on_bad_food_pressed() -> void:
	_prepare_popup("bad_food")


func _on_weight_pressed() -> void:
	_prepare_popup("weight")


func _on_texture_pressed() -> void:
	_prepare_popup("texture")
