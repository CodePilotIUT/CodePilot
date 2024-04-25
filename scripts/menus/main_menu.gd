extends Control

func _on_button_levels_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/levels_menu.tscn")

func _on_button_rules_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/rules_menu.tscn")

func _on_button_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/credits_menu.tscn")

func _on_button_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/options_menu.tscn")

func _on_button_exit_pressed():
	get_tree().quit()

func _process(_delta):
	# if the window is resized above 1500px wide, the margins should be increased
	var width = get_viewport().size.x
	var content_max_width = 500.0
	if width > content_max_width:
		$MarginContainer.add_theme_constant_override("margin_left", width/2 - content_max_width/2)
		$MarginContainer.add_theme_constant_override("margin_right", width/2 - content_max_width/2)
	else:
		$MarginContainer.add_theme_constant_override("margin_left", 100)
		$MarginContainer.add_theme_constant_override("margin_right", 100)
