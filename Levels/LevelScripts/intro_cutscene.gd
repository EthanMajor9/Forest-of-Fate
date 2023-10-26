extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready():
	animation_player.play("intro_cutscene")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "intro_cutscene":
		get_tree().change_scene_to_file("res://Levels/level1.tscn")
