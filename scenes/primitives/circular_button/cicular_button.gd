@tool
class_name CircularButton
extends Button


func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED and Engine.is_editor_hint():
		var diameter: float = max(size.x, size.y)
		size.x = diameter
		size.y = diameter

		var style_box: StyleBoxFlat = get_theme_stylebox("normal").duplicate()
		style_box.corner_radius_bottom_left = int(diameter / 2)
		style_box.corner_radius_bottom_right = int(diameter / 2)
		style_box.corner_radius_top_left = int(diameter / 2)
		style_box.corner_radius_top_right = int(diameter / 2)
		style_box.corner_detail = 20
		add_theme_stylebox_override("normal", style_box)
