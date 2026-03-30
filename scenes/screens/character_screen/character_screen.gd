extends Control

enum Character { EDDY, REIZY, MAKTY }
@export var character: Character = Character.EDDY

@export var eddy_frames: Array[Texture2D]
@export var reizy_frames: Array[Texture2D]
@export var makty_frames: Array[Texture2D]

@onready var popup: PanelContainer = $PanelContainer/MarginContainer/Contents/Buttons/InfoPopup
@onready
var popup_title: Label = $PanelContainer/MarginContainer/Contents/Buttons/InfoPopup/MarginContainer/Contents/PopupTitleLabel
@onready
var popup_text: Label = $PanelContainer/MarginContainer/Contents/Buttons/InfoPopup/MarginContainer/Contents/PopupTextLabel
@onready
var _anim: AnimatedTextureRect = $PanelContainer/MarginContainer/Contents/Right/AnimatedTextureRect


func _ready() -> void:
	if character == Character.EDDY:
		_anim.frames = eddy_frames
	elif character == Character.REIZY:
		_anim.frames = reizy_frames
	else:
		_anim.frames = makty_frames


func _on_close_button_pressed() -> void:
	visible = false


func _on_close_popup_button_pressed() -> void:
	popup.visible = false


func _prepare_popup(title: String) -> void:
	if popup.visible:
		return

	popup_title.text = title
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
