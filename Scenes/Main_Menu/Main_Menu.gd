extends Control
signal new_game()
signal settings()
signal quit()

func _on_btn_new_game_pressed():
	emit_signal("new_game")

func _on_btn_settings_pressed():
	emit_signal("settings")

func _on_btn_quit_pressed():
	emit_signal("quit")	
