extends Button

var button_pressed_texture : Texture2D
var button_unpressed_texture : Texture2D


func _ready():
	button_pressed_texture = preload("res://Art/3rdParty/Buttons/play_unfilled.png")
	button_unpressed_texture = preload("res://Art/3rdParty/Buttons/play_filled.png")
	
func _on_button_down():
	self.icon = button_pressed_texture

func _on_button_up():
	self.icon = button_unpressed_texture

func _on_pressed():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")
