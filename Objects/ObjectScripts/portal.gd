extends Area2D

@export var transitioner : Transitioner
@export var anim_to_play : String = "fade_in"	
@export var character : CharacterBody2D
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D

func _ready():
	animation_player.play("float")
	sprite.flip_h = true

func _on_body_entered(_body):
	if _body is Player:
		if(anim_to_play == "fade_in"):
			transitioner.set_next_animation(false)
		else:
			transitioner.set_next_animation(true)
		character.queue_free()
