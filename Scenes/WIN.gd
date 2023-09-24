extends Control

signal menu()
	
func _on_back_to_menu_pressed():
	emit_signal('menu')
