extends Node2D

@export var idle_duration : float = 1.0

@onready var audio_player : AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var move_to : Vector2 = Vector2.RIGHT * 192
@export var saw  : CharacterBody2D
var player_vars : PlayerVariables

func _ready():
	player_vars = get_node("/root/PlayerVariables")
	var tween = create_tween().set_loops()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	
	_init_tween(tween)
	
func _init_tween(tween : Tween):
	tween.tween_property($Saw, "position", Vector2.ZERO, 1)
	tween.tween_interval(idle_duration)
	tween.tween_property($Saw, "position", move_to, 1)
	tween.tween_interval(idle_duration)
	


func _on_hit_detection_body_entered(body):
	if body is Player:
		player_vars.health -= 30
		body.velocity.y = -200
		audio_player.play(0)
