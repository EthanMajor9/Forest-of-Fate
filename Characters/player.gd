extends CharacterBody2D

@export var move_speed : float = 100

@onready var sprite = $Sprite2D	
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _physics_process(_delta):
	var move_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"),		
	)
	
	update_direction(move_direction)		
	velocity = move_direction * move_speed
	select_new_state()
	
	move_and_slide()


func update_direction(move_direction):
	if(move_direction != Vector2.ZERO):
		if(move_direction.x > 0):
			sprite.flip_h = false;
		else:
			sprite.flip_h = true;
			
func select_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Run")
	else:
		state_machine.travel("Idle")
		
			
