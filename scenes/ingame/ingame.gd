extends Control

var code_editor_panel
var code_library_panel

func _ready():
	code_editor_panel = %CodeEditorPanel
	code_library_panel = %CodeLibraryPanel

	if not GameData.is_level_path_set():
		return
	
	load_level(GameData.current_level_path)


func load_level(path: String):
	print("Loading level from path: " + path)
	GameData.load_level_data()
	code_editor_panel.add_new_code_block("Level %d loaded!" % GameData.current_level_data["level_number"])
