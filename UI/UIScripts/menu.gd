extends Node2D

@onready var audio_player : AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_audio_stream_player_2d_finished():
	audio_player.play(0)
