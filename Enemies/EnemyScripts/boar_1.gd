extends CharacterBody2D

class_name Boar

@export var speed : float = -75

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer

var player_vars : PlayerVariables
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_right : bool = false

func _ready():
	player_vars = get_node("/root/PlayerVariables")
	sprite.play("run")

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


func _on_area_2d_body_entered(body):
	if body is Player:
		player_vars.health -= 45
		body.velocity.y = -200
		audio_player.play(0)
	elif body is Boar:
		flip()
