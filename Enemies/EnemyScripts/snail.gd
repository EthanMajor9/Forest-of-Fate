extends CharacterBody2D

@onready var anim_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var audio_player : AudioStreamPlayer2D = $AudioStreamPlayer2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_vars : PlayerVariables
var speed : float = -75
var facing_right : bool = false

func _ready():
	player_vars = get_node("/root/PlayerVariables")
	anim_player.play("walk")

func _physics_process(delta):
	if(not is_on_floor()):
		velocity.y += gravity * delta
		
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
		
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if(facing_right):
		speed = abs(speed)
	else:
		speed = abs(speed) * -1	 

func _on_hit_detection_body_entered(body):
	if body is Player:
		player_vars.health -= 50
		body.velocity.y = -200
		audio_player.play(0)	

