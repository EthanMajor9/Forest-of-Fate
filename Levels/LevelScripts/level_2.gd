extends Node2D

@export var transitioner : Transitioner

func _ready():
	transitioner.set_next_animation(true)
