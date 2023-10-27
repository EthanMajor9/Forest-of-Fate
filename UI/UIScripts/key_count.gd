extends CanvasLayer

class_name KeyCount

@onready var key_count_label : Label = $Control/MarginContainer/VBoxContainer/HBoxContainer/Sprite2D/KeyCount
@onready var animation_player : AnimationPlayer = $AnimationPlayer
var player_vars : PlayerVariables

func _ready():
	player_vars = get_node("/root/PlayerVariables")
	animation_player.play("rotate")
	self.visible = true

func _process(_delta):
	update_key_label()

func update_key_label():
	key_count_label.text = str(player_vars.key_count)
