extends Control

var _viewed_image: TextureRect
var _pictures: Array[TextureButton]
@onready var image_viewer: Control = $ImageViewer


func _ready() -> void:
	_viewed_image = find_child("ViewedImage")

	for i: int in range(16):
		_pictures.append(find_child("Picture" + str(i + 1)))


func _on_close_button_pressed() -> void:
	image_viewer.visible = false


func _on_pic_1_pressed() -> void:
	_viewed_image.texture = _pictures[0].texture_normal
	image_viewer.visible = true


func _on_pic_2_pressed() -> void:
	_viewed_image.texture = _pictures[1].texture_normal
	image_viewer.visible = true


func _on_pic_3_pressed() -> void:
	_viewed_image.texture = _pictures[2].texture_normal
	image_viewer.visible = true


func _on_pic_4_pressed() -> void:
	_viewed_image.texture = _pictures[3].texture_normal
	image_viewer.visible = true


func _on_pic_5_pressed() -> void:
	_viewed_image.texture = _pictures[4].texture_normal
	image_viewer.visible = true


func _on_pic_6_pressed() -> void:
	_viewed_image.texture = _pictures[5].texture_normal
	image_viewer.visible = true
