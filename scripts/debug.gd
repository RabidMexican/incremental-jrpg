extends Node

func _unhandled_key_input(event: InputEvent) -> void:
	var event_key: InputEventKey = event
	
	if event.is_pressed():
		match event_key.keycode:
			KEY_F5:
				get_tree().reload_current_scene()
				
			KEY_F6:
				get_tree().quit()
