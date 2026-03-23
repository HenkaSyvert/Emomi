extends PanelContainer


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


@onready var imageViewer: Control = $ImageViewer


func _on_close_button_pressed() -> void:
	imageViewer.visible = false


@export var pics: Array[TextureButton]
@onready
var viewed_image: TextureRect = $ImageViewer/HBoxContainer/ImageViewer/VBoxContainer/TextureRect


func _on_pic_1_pressed() -> void:
	viewed_image.texture = pics[0].texture_normal
	imageViewer.visible = true


func _on_pic_2_pressed() -> void:
	viewed_image.texture = pics[1].texture_normal
	imageViewer.visible = true


func _on_pic_3_pressed() -> void:
	viewed_image.texture = pics[2].texture_normal
	imageViewer.visible = true


func _on_pic_4_pressed() -> void:
	viewed_image.texture = pics[3].texture_normal
	imageViewer.visible = true


func _on_pic_5_pressed() -> void:
	viewed_image.texture = pics[4].texture_normal
	imageViewer.visible = true


func _on_pic_6_pressed() -> void:
	viewed_image.texture = pics[5].texture_normal
	imageViewer.visible = true
