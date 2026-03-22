extends Control


@export var poss: Array[Texture2D]
@export var negs: Array[Texture2D]
@export var opts: Array[AnimatedButton]
var balance: int = -1


func make_new_opt():
	var newFrame: Texture2D
	if balance < 0:
		newFrame = negs[0]
		negs.erase(newFrame) 
	else:
		newFrame=poss[0]
		poss.erase(newFrame)
	
