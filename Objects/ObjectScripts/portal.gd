extends Area2D

@export var transitioner : Transitioner
@export var anim_to_play : String = "fade_in"	
@export var character : CharacterBody2D
@export var keys_to_open : float = 0

@onready var main_animation_player : AnimationPlayer = $MainAnimationPlayer
@onready var indicator_animation_player : AnimationPlayer = $IndicatorAnimationPlayer
@onready var portal_sprite : Sprite2D = $PortalSprite
@onready var key_tooltip : Label = $KeyIndicator

var player_vars : PlayerVariables

func _ready():
	player_vars = get_node("/root/PlayerVariables")
	main_animation_player.play("float")
	indicator_animation_player.play("rotate")
	portal_sprite.flip_h = true
	key_tooltip.text = str(keys_to_open)

func _on_body_entered(_body):
	if _body is Player:
		if player_vars.key_count == keys_to_open:
			player_vars.key_count -= keys_to_open
			if(anim_to_play == "fade_in"):
				transitioner.set_next_animation(false)
			else:
				transitioner.set_next_animation(true)
			character.queue_free()
