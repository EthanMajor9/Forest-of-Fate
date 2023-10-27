extends Node2D

var player_vars : PlayerVariables
@onready var animation_player : AnimationPlayer = $Key/AnimationPlayer
@onready var audio_player : AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player_vars = get_node("/root/PlayerVariables")
	animation_player.play("rotate")

func _on_area_2d_body_entered(body):
	if body is Player:
		player_vars.key_count += 1
		audio_player.play(0)
		remove_child($Key)

func _on_audio_stream_player_2d_finished():
	queue_free()
