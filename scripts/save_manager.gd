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

func init_save_dir():
	if not DirAccess.dir_exists_absolute(save_dir_path):
		DirAccess.make_dir_recursive_absolute(save_dir_path)

func save_level(level_number, data):
	if level_number == null:
		return
	level_number = int(level_number)
	
	var file_path = save_dir_path + "level_%d.codepilot" % level_number
	print("Saving to: " + file_path)
	var file = FileAccess.open(file_path, FileAccess.WRITE_READ)
	file.store_string(data)

func load_level_as_text(level_number) -> String:
	if level_number == null:
		return ""
	level_number = int(level_number)
	
	var file_path = save_dir_path + "level_%d.codepilot" % level_number
	print("Loading from: " + file_path)
	
	if not FileAccess.file_exists(file_path):
		FileAccess.open(file_path, FileAccess.WRITE)
	var file = FileAccess.open(file_path, FileAccess.READ)
	var data = file.get_as_text()
	return data

func load_level_as_code_dict(level_number) -> Array[Dictionary]:
	var data = load_level_as_text(level_number)

	var code_blocks: Array[Dictionary] = []
	for line in data.split("\n"):
		if line == "":
			continue
		
		var function_name
		var arg
		if "(" in line and ")" in line:
			var start = line.find("(")
			var end = line.find(")")
			function_name = line.substr(0, start).strip_edges()
			arg = line.substr(start + 1, end - start - 1).strip_edges()
		else:
			function_name = line.strip_edges()
			arg = null
		
		var code_block_dict = {
			"function_name": function_name,
			"arg": arg
		}
		code_blocks.append(code_block_dict)

	return code_blocks

func load_level_as_code_blocks(level_number) -> Array[CodeBlock]:
	var code_blocks: Array[Dictionary] = load_level_as_code_dict(level_number)

	var code_block_nodes: Array[CodeBlock] = []
	for code_block in code_blocks:
		var function_name = code_block.get("function_name")
		var arg = code_block.get("arg")
		
		var code_block_node: CodeBlock = CodeBlocks.get_code_block(function_name)
		if code_block_node != null:
			if arg != null:
				code_block_node.set_input(arg)
			code_block_nodes.append(code_block_node)

	return code_block_nodes
