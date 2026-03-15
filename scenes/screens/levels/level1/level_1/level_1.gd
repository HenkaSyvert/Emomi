extends PanelContainer

@export var mainAnimFrames: Array[Texture2D]
@export var opt1AnimFrames: Array[Texture2D]
@export var opt2AnimFrames: Array[Texture2D]
@export var opt3AnimFrames: Array[Texture2D]

@onready var mainAnim = $HBoxContainer/Middle/HBoxContainer/AnimatedTexture
@onready var opt1: TextureButton = $HBoxContainer/Right/Option1
@onready var opt2: TextureButton = $HBoxContainer/Right/Option2
@onready var opt3: TextureButton = $HBoxContainer/Right/Option3

var curr_opt_frame: int = 0


func _ready() -> void:
	mainAnim.frames = mainAnimFrames
	opt1.texture_normal = opt1AnimFrames[curr_opt_frame]
	opt2.texture_normal = opt2AnimFrames[curr_opt_frame]
	opt3.texture_normal = opt3AnimFrames[curr_opt_frame]


func _on_home_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/main_menu/main_menu.tscn"
	)
	assert(err == OK)


func _on_return_button_pressed() -> void:
	var err: Error = get_tree().change_scene_to_file(
		"res://scenes/screens/level_select_menu/level_select_menu.tscn"
	)
	assert(err == OK)


func _on_timer_timeout() -> void:
	curr_opt_frame += 1
	curr_opt_frame %= 2
	opt1.texture_normal = opt1AnimFrames[curr_opt_frame]
	opt2.texture_normal = opt2AnimFrames[curr_opt_frame]
	opt3.texture_normal = opt3AnimFrames[curr_opt_frame]
