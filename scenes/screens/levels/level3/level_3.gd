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


func new_opt(opt: AnimatedButton):
	while true:
		var frames = pos_opts + neg_opts
		var is_unique: bool = true
		while not is_unique:
			is_unique = true
			var i: int = randi() % frames.size()
			var frame: Texture2D = frames[i]

			if (
				opt1.texture_normal == frame
				or op2.texture_normal == frame
				or opt3.texture_normal == frame
			):
				is_unique = false
			else:
				opt.texture_normal = frame
				opt.frames = [frame]
				opt.is_correct = pos_opts.count(frame)

		if opt1.is_correct or op2.is_correct or opt3.is_correct:
			break
