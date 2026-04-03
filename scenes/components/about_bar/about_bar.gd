@tool
extends AspectRatioContainer

@export var character: CharacterScreen.Character = CharacterScreen.Character.EDDY:
	set(value):
		character = value
		_apply_properties()

@export var texture_eddy: Texture2D
@export var texture_reizy: Texture2D
@export var texture_makty: Texture2D

@export var character_screen: CharacterScreen

@onready var about_button: TextureButton = $HBoxContainer/AboutButton


func _apply_properties() -> void:
	if is_inside_tree():
		if character == CharacterScreen.Character.EDDY:
			about_button.texture_normal = texture_eddy
		elif character == CharacterScreen.Character.REIZY:
			about_button.texture_normal = texture_reizy
		else:
			about_button.texture_normal = texture_makty

		if character_screen:
			character_screen.character = character


func _ready() -> void:
	_apply_properties()


func _on_about_button_pressed() -> void:
	character_screen.visible = true
