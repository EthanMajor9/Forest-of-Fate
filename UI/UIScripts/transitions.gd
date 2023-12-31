extends Control

class_name Transitioner

@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer

@export var scene_switch_anim : String = "fade_out"
@export var scene_to_load : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tex.visible = false
	
func set_next_animation(fading_out : bool):
	animation_tex.visible = true
	if(fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")		

func _on_animation_player_animation_finished(anim_name):
	if(scene_to_load != null && anim_name == scene_switch_anim):		
		get_tree().change_scene_to_packed(scene_to_load)
		
