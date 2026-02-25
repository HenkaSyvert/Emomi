extends Node

@onready var music_player: AudioStreamPlayer2D = $MusicPlayer

@export var is_muted: bool = true:
	set(value):
		is_muted = value

		if is_muted:
			music_player.stop()
		else:
			music_player.play()

	get:
		return is_muted
