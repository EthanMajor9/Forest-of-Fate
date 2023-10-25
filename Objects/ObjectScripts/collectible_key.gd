extends Node2D

var player_vars : PlayerVariables
@onready var animation_player : AnimationPlayer = $Key/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	player_vars = get_node("/root/PlayerVariables")
	animation_player.play("rotate")

func _on_area_2d_body_entered(body):
	if body is Player:
		player_vars.key_count += 1
		queue_free()
