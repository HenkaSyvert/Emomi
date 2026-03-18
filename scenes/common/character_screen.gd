extends Control

@export var eddy_frames: Array[Texture2D]
@export var reizy_frames: Array[Texture2D]
@export var makty_frames: Array[Texture2D]

enum CHARACTER { EDDY, MAKTY, REIZY }
@export var character: CHARACTER

@onready var personality: Label = $HBoxContainer/VBoxContainer/VBoxContainer/Personality/Label
@onready var likes: Label = $HBoxContainer/VBoxContainer/VBoxContainer/Likes/Label
@onready var dislikes: Label = $HBoxContainer/VBoxContainer/VBoxContainer/Dislikes/Label
@onready var fav_food: Label = $HBoxContainer/VBoxContainer/VBoxContainer/FavoriteFood/Label
@onready var bad_food: Label = $HBoxContainer/VBoxContainer/VBoxContainer/UnfavoriteFood/Label
@onready var weight: Label = $HBoxContainer/VBoxContainer/VBoxContainer/Weight/Label
@onready var texture: Label = $HBoxContainer/VBoxContainer/VBoxContainer/Texture/Label
@onready var characterName: Label = $HBoxContainer/VBoxContainer2/VBoxContainer/Label
@onready var emotion: Label = $HBoxContainer/VBoxContainer2/VBoxContainer/Label2
@onready var animTexture = $HBoxContainer/VBoxContainer2/AnimatedTexture


func _ready() -> void:
	if character == CHARACTER.EDDY:
		characterName.text = "Eddy"
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
var personality_tab: FoldableContainer = $HBoxContainer/VBoxContainer/VBoxContainer/Personality
@onready var likes_tab: FoldableContainer = $HBoxContainer/VBoxContainer/VBoxContainer/Likes
@onready var dislikes_tab: FoldableContainer = $HBoxContainer/VBoxContainer/VBoxContainer/Dislikes
@onready
var fav_food_tab: FoldableContainer = $HBoxContainer/VBoxContainer/VBoxContainer/FavoriteFood
@onready
var bad_food_tab: FoldableContainer = $HBoxContainer/VBoxContainer/VBoxContainer/UnfavoriteFood
@onready var weight_tab: FoldableContainer = $HBoxContainer/VBoxContainer/VBoxContainer/Weight
@onready var texture_tab: FoldableContainer = $HBoxContainer/VBoxContainer/VBoxContainer/Texture


func _on_personality_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = personality_tab
	if prevTab:
		prevTab.folded = true


func _on_likes_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = likes_tab
	if prevTab:
		prevTab.folded = true


func _on_dislikes_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = dislikes_tab
	if prevTab:
		prevTab.folded = true


func _on_favorite_food_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = fav_food_tab
	if prevTab:
		prevTab.folded = true


func _on_unfavorite_food_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = bad_food_tab
	if prevTab:
		prevTab.folded = true


func _on_weight_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = weight_tab
	if prevTab:
		prevTab.folded = true


func _on_texture_folding_changed(is_folded: bool) -> void:
	prevTab = currentTab
	if not is_folded:
		currentTab = texture_tab
	if prevTab:
		prevTab.folded = true
