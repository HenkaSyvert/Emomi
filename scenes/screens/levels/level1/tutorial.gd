extends Sprite2D

@export var source: Control
@export var target: Control


func _ready() -> void:
	var tween: Tween = create_tween()

	var pos: Vector2 = target.global_position + target.size / 2
	@warning_ignore("return_value_discarded")
	tween.tween_property(self, "position", pos, 2)

	@warning_ignore("return_value_discarded")
	tween.tween_interval(3)
	@warning_ignore("return_value_discarded")
	tween.set_loops(5)
