extends Control

var level_button_scene: PackedScene = preload("res://scenes/menus/elements/level_button.tscn")

func _ready():
	create_level_buttons()

func load_levels():
	"""Load all the levels from the levels directory"""
	var levels = []

	var dir = DirAccess.open("res://levels")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".json"):
				var level_number = get_level_number_from_file("res://levels/" + file_name)
				levels.append({"file_name": file_name, "level_number": level_number})
			file_name = dir.get_next()
		return levels
	else:
		print("Failed to open the directory.")

func create_level_buttons():
	"""Create the level buttons from the levels list"""
	var levels = load_levels()

	# Sort the levels by level number
	levels.sort_custom(func(x, y): return x["level_number"] < y["level_number"])

	for level in levels:
		create_level_button(level["file_name"], level["level_number"])

func create_level_button(file_name: String, level_number: int):
	var level_button = level_button_scene.instantiate()
	%LevelsList.add_child(level_button)
	level_button.set_level_number(level_number)
	level_button.set_level_path("res://levels/" + file_name)

func get_level_number_from_file(path: String) -> int:
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		file.close()
		var json = JSON.new()
		var error = json.parse(json_text)
		if error == OK:
			var data = json.data
			if typeof(data) == TYPE_DICTIONARY and "level_number" in data:
				return int(data["level_number"])
		else:
			print("JSON parsing error: ", error)
	return 0

func populate_with_buttons(n):
	"""Populate the list with n button (for testing purposes)"""
	var list = %LevelsList
	for i in range(n):
		var button = level_button_scene.instantiate()
		button.set_level(i+1)
		button.set_star1(randi_range(0, 1))
		button.set_star2(randi_range(0, 1))
		list.add_child(button)
