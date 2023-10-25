extends State

class_name LandingState

@export var landing_anim_name : String = "landing"
@export var ground_state : State

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == landing_anim_name):
		next_state = ground_state
		
func state_input(_event : InputEvent):
	pass
