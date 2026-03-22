extends Control
class_name Level3

@export var poss: Array[Texture2D]
@export var negs: Array[Texture2D]
@export var opts: Array[AnimatedButton]

@export var balance: int = -1


func new_opt(is_correct: bool) -> Dictionary:
	balance -= 1 if is_correct else -1

	var new_correct: int
	if balance == 0:
		new_correct = [true, false].pick_random()
	else:
		new_correct = true if balance < 0 else false

	balance += 1 if new_correct else -1
	var f: Texture2D
	while true:
		if new_correct:
			f = poss.pick_random()
		else:
			f = negs.pick_random()
		if (
			f != opts[0].texture_normal
			and f != opts[1].texture_normal
			and f != opts[2].texture_normal
		):
			break
	return {"texture": f, "is_correct": new_correct}
