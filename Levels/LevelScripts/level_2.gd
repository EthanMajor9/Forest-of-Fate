extends Node2D

@export var transitioner : Transitioner
@onready var audio_player : AudioStreamPlayer2D = $AudioStreamPlayer2D
var test : PlayerVariables

func _ready():
	transitioner.set_next_animation(true)
	test = get_node("/root/PlayerVariables")
	print("Scene2: " + str(test.key_count))
	audio_player.play(0)


func _on_audio_stream_player_2d_finished():
	audio_player.play(0)
