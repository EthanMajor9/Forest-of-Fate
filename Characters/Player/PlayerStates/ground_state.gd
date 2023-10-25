extends State

class_name GroundState

@export var air_state : State
@export var jump_anim : String = "jump"
@export var audio_player : AudioStreamPlayer2D 

var player_vars : PlayerVariables

func _ready():
	player_vars = get_node("/root/PlayerVariables")

func state_process(_delta):
	if(!character.is_on_floor()):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()

func jump():
	character.velocity.y = player_vars.jump_velocity
	next_state = air_state
	playback.travel(jump_anim)
	audio_player.playing = true
	
	
