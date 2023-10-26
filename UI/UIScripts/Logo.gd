extends TextureRect

const IDLE_DURATION : float = 0.2

func _ready():
	var tween = create_tween().set_loops()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	
	_init_tween(tween)
	
func _init_tween(tween : Tween):
	tween.tween_property(self, "position", Vector2(-58, -312), 2)
	tween.tween_interval(IDLE_DURATION)
	tween.tween_property(self, "position", Vector2(-58, -318), 2)
	tween.tween_interval(IDLE_DURATION)
