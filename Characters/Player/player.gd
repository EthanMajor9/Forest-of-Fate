extends CharacterBody2D

class_name Player

@export var move_speed : float = 200.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_vars : PlayerVariables
var direction : Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true
	player_vars = get_node("/root/PlayerVariables")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		
	move_and_slide()
	update_animation_parameters()
	update_sprite_direction()

	print(player_vars.key_count)

func update_animation_parameters():
	animation_tree.set("parameters/Move/blend_position", direction.x)

func update_sprite_direction():
	if direction.x < 0:
		sprite.flip_h = true;
	elif direction.x > 0:
		sprite.flip_h = false;

