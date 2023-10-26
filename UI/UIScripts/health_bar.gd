extends TextureProgressBar

var player_vars : PlayerVariables

# Called when the node enters the scene tree for the first time.
func _ready():
	player_vars = get_node("/root/PlayerVariables")
	self.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.value = player_vars.health
