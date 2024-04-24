extends Control

var level_button_scene: PackedScene = preload("res://scenes/menus/elements/level_button.tscn")

func _ready():
	load_level_buttons()

func load_level_buttons():
	var dir := DirAccess.open("res://levels")
	if dir:
		print("Directory opened")
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var level_number := 0
		while file_name != "":
			if file_name.ends_with(".json") or true:
				level_number += 1
				print("Creation du bouton pour le niveau %d" % level_number)
				create_level_button(file_name, level_number)
			file_name = dir.get_next()
	else:
		print("Failed to open the directory.")

func create_level_button(file_name: String, level_number: int):
	var level_button := level_button_scene.instantiate()
	%LevelsList.add_child(level_button)
	level_button.set_level(level_number)

func get_button_text(file_name: String) -> String:
	return file_name.replace(".json", "").capitalize()

func populate_with_buttons(n):
	"""Populate the list with n button (for testing purposes)"""
	var list = %LevelsList
	for i in range(n):
		var button = level_button_scene.instantiate()
		button.set_level(i+1)
		button.set_star1(randi_range(0, 1))
		button.set_star2(randi_range(0, 1))
		list.add_child(button)
