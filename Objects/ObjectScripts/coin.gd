extends Node2D

var player_vars : PlayerVariables 
@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	player_vars = get_node("/root/PlayerVariables")
	animation_player.play("rotate")

func _on_area_2d_body_entered(body):
	if body is Player:
		player_vars.money += 10
		queue_free()
