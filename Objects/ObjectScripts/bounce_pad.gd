extends StaticBody2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("pulse")

func _on_area_2d_body_entered(body):
	if(body is Player):
		body.velocity.y += -400

			
