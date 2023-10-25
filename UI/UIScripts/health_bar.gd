extends CanvasLayer
@onready var container : MarginContainer = $MarginContainer
@onready var health_bar : ProgressBar = $MarginContainer/Control/ProgressBar
var player_vars : PlayerVariables

# Called when the node enters the scene tree for the first time.
func _ready():
	player_vars = get_node("/root/PlayerVariables")
	container.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	health_bar.value = player_vars.health
