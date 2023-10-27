extends Node

@onready var audio_player : AudioStreamPlayer2D = $AudioStreamPlayer2D
@export var transitioner : Transitioner
var test : PlayerVariables

func _ready():
	transitioner.set_next_animation(true)
	test = get_node("/root/PlayerVariables")


func _on_audio_stream_player_2d_finished():
	audio_player.play(0)
