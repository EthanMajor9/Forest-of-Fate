extends CanvasLayer

@onready var container : Control = $Control
@onready var coin_count_label : Label = $Control/MarginContainer/VBoxContainer/HBoxContainer/Sprite2D/CoinCount
@onready var animation_player : AnimationPlayer = $AnimationPlayer
var player_vars : PlayerVariables

func _ready():
	player_vars = get_node("/root/PlayerVariables")
	container.visible = true
	animation_player.play("rotate")

func _process(_delta):
	update_coin_label()

func update_coin_label():
	coin_count_label.text = str(player_vars.money)
