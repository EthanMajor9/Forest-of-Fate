extends Node2D

const IDLE_DURATION : float = 1.0

@export var move_to : Vector2 = Vector2.RIGHT * 192
@export var platform  : CharacterBody2D

func _ready():
	var tween = create_tween().set_loops()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	
	_init_tween(tween)
	
func _init_tween(tween : Tween):
	tween.tween_property($Platform, "position", Vector2.ZERO, 1)
	tween.tween_interval(IDLE_DURATION)
	tween.tween_property($Platform, "position", move_to, 1)
	tween.tween_interval(IDLE_DURATION)
	
