class_name Level3
extends Control

@export var poss: Array[Texture2D]
@export var negs: Array[Texture2D]
@export var opts: Array[DraggableOption]
@export var balance: int = -1

@export var frames: Array[Texture2D]
@export var anger: int = 3
var anim: AnimatedTextureRect

@onready var popup: PanelContainer = $MarginContainer/Popup
@onready var asp_correct: AudioStreamPlayer2D = $CorrectSound
@onready var asp_wrong: AudioStreamPlayer2D = $WrongSound


func _update_frames() -> void:
	var frames_subset: Array[Texture2D] = [frames[anger - 1], frames[anger]]
	anim.frames = frames_subset


func _ready() -> void:
	anim = (find_child("QuestionDragTarget") as QuestionDragTarget)._anim
	_update_frames()


func new_opt(is_correct: bool) -> Dictionary:
	balance -= 1 if is_correct else -1

	var new_correct: bool
	if balance == 0:
		new_correct = [true, false].pick_random()
	else:
		new_correct = balance < 0

	balance += 1 if new_correct else -1
	var f: Texture2D
	while true:
		if new_correct:
			f = poss.pick_random()
		else:
			f = negs.pick_random()
		if f != opts[0]._anim.texture and f != opts[1]._anim.texture and f != opts[2]._anim.texture:
			break
	return {"texture": f, "is_correct": new_correct}


func _on_question_drag_target_answered(is_correct: bool) -> void:
	if is_correct:
		anger -= 1
		if anger == 0:
			anim.pause()
			anim.texture = frames[0]
			asp_correct.play()
			var time: float = 1.0 / AnimatedTextureRect.FPS
			await get_tree().create_timer(time).timeout
			popup.visible = true
			return
	else:
		anger += 1
		anger = clamp(anger, anger, 3)
		asp_wrong.play()
	_update_frames()
