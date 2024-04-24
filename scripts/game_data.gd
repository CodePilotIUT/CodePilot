extends Node

var current_level_path: String = ""
var current_level_data: Dictionary = {}

func set_level_path(path: String):
	current_level_path = path

func get_level_path() -> String:
	return current_level_path

func is_level_path_set() -> bool:
	return current_level_path != ""

func set_level_data(data: Dictionary):
	current_level_data = data

func get_level_data() -> Dictionary:
	return current_level_data

func load_level_data() -> void:
	var file = FileAccess.open(GameData.current_level_path, FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		file.close()
		var json = JSON.new()
		var error = json.parse(json_text)
		if error == OK:
			var data = json.data
			if typeof(data) == TYPE_DICTIONARY:
				GameData.set_level_data(data)
		else:
			print("JSON parsing error: ", error)

func is_level_data_set() -> bool:
	return current_level_data != {}

func clear_level_data():
	current_level_data = {}
	current_level_path = ""

func get_value(key: String) -> Variant:
	return current_level_data[key]

func get_value_or_null(key: String) -> Variant:
	if current_level_data.has(key):
		return current_level_data[key]
	else:
		return null
