extends Node

var nr_completed_levels: int = 0
var nr_of_stars: int = 0

@onready var background_asp: AudioStreamPlayer2D = $BackgroundMusicPlayer


func _process(_delta: float) -> void:
	if Input.is_action_pressed(&"exit"):
		get_tree().quit()


func _input(event: InputEvent) -> void:
	@warning_ignore("unsafe_property_access")
	if event is InputEventScreenTouch and event.pressed:
		AudioServer.unlock()
		background_asp.play()
