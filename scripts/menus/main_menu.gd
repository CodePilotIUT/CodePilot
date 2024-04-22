extends Control

func _on_button_levels_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/levels_menu.tscn")

func _on_button_rules_pressed():
	pass

func _on_button_credits_pressed():
	pass

func _on_button_settings_pressed():
	pass

func _on_button_exit_pressed():
	get_tree().quit()
