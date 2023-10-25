extends Node2D

@export var transitioner : Transitioner
var test : PlayerVariables

func _ready():
	transitioner.set_next_animation(true)
	test = get_node("/root/PlayerVariables")
	print("Scene2: " + str(test.key_count))
