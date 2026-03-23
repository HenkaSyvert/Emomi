extends Control

@export var eddy_frames: Array[Texture2D]
@export var reizy_frames: Array[Texture2D]
@export var makty_frames: Array[Texture2D]

enum CHARACTER { EDDY, MAKTY, REIZY }
@export var character: CHARACTER

@onready
var personality: Label = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Personality/Label
@onready var likes: Label = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Likes/Label
@onready
var dislikes: Label = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Dislikes/Label
@onready
var fav_food: Label = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/FavoriteFood/Label
@onready
var bad_food: Label = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/UnfavoriteFood/Label
@onready var weight: Label = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Weight/Label
@onready var texture: Label = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Texture/Label
@onready
var characterName: Label = $PanelContainer/HBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer/Label2
@onready var emotion: Label = $PanelContainer/HBoxContainer/VBoxContainer2/VBoxContainer/Label2
@onready
var animTexture: AnimatedTextureRect = $PanelContainer/HBoxContainer/VBoxContainer2/AnimatedTexture

@onready var tabContainer: VBoxContainer = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer


func _ready() -> void:
	if character == CHARACTER.EDDY:
		tabContainer.theme = load(
			"res://scenes/screens/character_screen/themes/eddy/eddy_theme.tres"
		)
		characterName.text = "Eddy"
		characterName.add_theme_color_override(&"font_color", "#1EBBE4")

		emotion.text = tr("CHAR_EDDY_EMOTION")
		animTexture.frames = eddy_frames
		animTexture.texture = eddy_frames[-1]
		personality.text = tr("CHAR_EDDY_PERSONALITY_TEXT")
		likes.text = tr("CHAR_EDDY_LIKES_TEXT")
		dislikes.text = tr("CHAR_EDDY_DISLIKE_TEXT")
		fav_food.text = tr("CHAR_EDDY_FAV_FOOD_TEXT")
		bad_food.text = tr("CHAR_EDDY_BAD_FOOD_TEXT")
		weight.text = tr("CHAR_EDDY_WEIGHT_TEXT")
		texture.text = tr("CHAR_EDDY_TEXTURE_TEXT")
	elif character == CHARACTER.MAKTY:
		characterName.text = "Makty"
		characterName.add_theme_color_override(&"font_color", "#F5AE1E")
		tabContainer.theme = load(
			"res://scenes/screens/character_screen/themes/makty/makty_theme.tres"
		)
		emotion.text = tr("CHAR_MAKTY_EMOTION")
		animTexture.frames = makty_frames
		animTexture.texture = makty_frames[-1]
		personality.text = tr("CHAR_MAKTY_PERSONALITY_TEXT")
		likes.text = tr("CHAR_MAKTY_LIKES_TEXT")
		dislikes.text = tr("CHAR_MAKTY_DISLIKES_TEXT")
		fav_food.text = tr("CHAR_MAKTY_FAV_FOOD_TEXT")
		bad_food.text = tr("CHAR_MAKTY_BAD_FOOD_TEXT")
		weight.text = tr("CHAR_MAKTY_WEIGHT_TEXT")
		texture.text = tr("CHAR_MAKTY_TEXTURE_TEXT")
	else:
		characterName.text = "Reizy"
		tabContainer.theme = load(
			"res://scenes/screens/character_screen/themes/reizy/reizy_theme.tres"
		)
		characterName.add_theme_color_override(&"font_color", "#CF4B34")
		emotion.text = tr("CHAR_REIZY_EMOTION")
		animTexture.frames = reizy_frames
		animTexture.texture = reizy_frames[-1]
		personality.text = tr("CHAR_REIZY_PERSONALITY_TEXT")
		likes.text = tr("CHAR_REIZY_LIKES_TEXT")
		dislikes.text = tr("CHAR_REIZY_DISLIKES_TEXT")
		fav_food.text = tr("CHAR_REIZY_FAV_FOOD_TEXT")
		bad_food.text = tr("CHAR_REIZY_BAD_FOOD_TEXT")
		weight.text = tr("CHAR_REIZY_WEIGHT_TEXT")
		texture.text = tr("CHAR_REIZY_TEXTURE_TEXT")


var currentTab: FoldableContainer = null
var prevTab: FoldableContainer = null
@onready
var personality_tab: FoldableContainer = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Personality
@onready
var likes_tab: FoldableContainer = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Likes
@onready
var dislikes_tab: FoldableContainer = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Dislikes
@onready
var fav_food_tab: FoldableContainer = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/FavoriteFood
@onready
var bad_food_tab: FoldableContainer = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/UnfavoriteFood
@onready
var weight_tab: FoldableContainer = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Weight
@onready
var texture_tab: FoldableContainer = $PanelContainer/HBoxContainer/VBoxContainer/VBoxContainer/Texture


func _on_personality_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = personality_tab
	if prevTab and prevTab != currentTab:
		prevTab.folded = true


func _on_likes_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = likes_tab
	if prevTab and prevTab != currentTab:
		prevTab.folded = true


func _on_dislikes_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = dislikes_tab
	if prevTab and prevTab != currentTab:
		prevTab.folded = true


func _on_favorite_food_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = fav_food_tab
	if prevTab and prevTab != currentTab:
		prevTab.folded = true


func _on_unfavorite_food_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = bad_food_tab
	if prevTab and prevTab != currentTab:
		prevTab.folded = true


func _on_weight_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = weight_tab
	if prevTab and prevTab != currentTab:
		prevTab.folded = true


func _on_texture_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = texture_tab
	if prevTab and prevTab != currentTab:
		prevTab.folded = true


func _on_button_pressed() -> void:
	visible = false
