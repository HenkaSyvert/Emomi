extends Control

@export var pos_opts: Array[Texture2D]
@export var neg_opts: Array[Texture2D]
@export var frames: Array[Texture2D]
var emotion_level: int = 0

@onready var animTexture = $Level1Template/HBoxContainer/Middle/HBoxContainer/AnimatedTexture
@onready var opt1: AnimatedButton = $Level1Template/HBoxContainer/Right/Opt1
@onready var op2: AnimatedButton = $Level1Template/HBoxContainer/Right/Opt2
@onready var opt3: AnimatedButton = $Level1Template/HBoxContainer/Right/Opt3


func _ready() -> void:
	pass
