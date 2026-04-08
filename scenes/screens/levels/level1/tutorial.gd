class_name Tutorial
extends Sprite2D

@export var target: Node2D

@export var show_tutorial: bool = true:
	set(value):
		show_tutorial = value
		visible = value


func _ready() -> void:
	var start_pos: Vector2 = position
	var tween: Tween = create_tween()

	@warning_ignore("return_value_discarded")
	tween.tween_property(self, "position", target.position, 2)

	@warning_ignore("return_value_discarded")
	tween.tween_interval(1)
	@warning_ignore("return_value_discarded")
	tween.tween_property(self, "position", start_pos, 0)
	@warning_ignore("return_value_discarded")
	tween.set_loops(2)
