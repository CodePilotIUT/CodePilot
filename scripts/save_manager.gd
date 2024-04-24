extends Node

var game_executable_dir
var save_dir_path

func _ready():
	# If the game is running in debug mode, save files in the user:// directory.
	# If the game is running in release mode, save files in the same directory as the executable.
	if OS.is_debug_build():
		game_executable_dir = "user://"
	else:
		game_executable_dir = OS.get_executable_path().get_base_dir() + "/"
	save_dir_path = game_executable_dir + "save_files/"
	
	init_save_dir()
	for i in range(1, 4):
		save_level(1, "Hello, World!")

func init_save_dir():
	if not DirAccess.dir_exists_absolute(save_dir_path):
		DirAccess.make_dir_recursive_absolute(save_dir_path)

func save_level(level_number, data):
	var file_path = save_dir_path + "level_%d.codepilot" % level_number
	print("Saving to: " + file_path)
	var file = FileAccess.open(file_path, FileAccess.WRITE_READ)
	file.store_string(data)
