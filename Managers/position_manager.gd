extends Area2D

@export var pos_to_move_to : Vector2

func _on_body_entered(body):
	if body is Player:
		body.position = pos_to_move_to
