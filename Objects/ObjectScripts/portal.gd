extends Area2D

@export var transitioner : Transitioner
@export var anim_to_play : String = "fade_in"	
@export var character : CharacterBody2D

func _on_body_entered(_body):
	print("entered")
	if(anim_to_play == "fade_in"):
		transitioner.set_next_animation(false)
	else:
		transitioner.set_next_animation(true)
	character.queue_free()
