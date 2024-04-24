extends Control

var level_button_scene = preload("res://scenes/menus/elements/level_button.tscn")

func _ready():
	populate_with_buttons(30)

func populate_with_buttons(n):
	var list = %LevelsList
	for i in range(n):
		var button = level_button_scene.instantiate()
		button.set_level(i+1)
		button.set_star1(randi_range(0, 1))
		button.set_star2(randi_range(0, 1))
		list.add_child(button)
