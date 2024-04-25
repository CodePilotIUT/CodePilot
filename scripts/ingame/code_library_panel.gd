extends Panel

var code_block_scene = preload("res://scenes/ingame/elements/code_block.tscn")
var code_editor: Panel
var code_library: Panel

var width: int = 300
var is_open: bool = true

func _ready():
	code_editor = %CodeEditorPanel
	code_library = %CodeLibraryPanel
	
	open_panel()
	
	custom_minimum_size.x = width
	set_width(width)
	
	fill_library_from_level()


func populate_randomly(n):
	for i in range(n):
		# Chose random color
		var r = randf()
		var g = randf()
		var b = randf()
		
		# Put random strings
		var line = ""
		for j in range(randi_range(3, 5)):
			line += str(i) + " "
		line.erase(line.length() - 1, 1)
		
		# Show randomly the input box
		var has_input = randi_range(0, 1)
		
		add_to_library_from_dict(line, Color(r,g,b), has_input)

func fill_library():
	for cb in CodeBlocks.get_all_code_blocks():
		print("Adding to library: " + cb.get_label())
		add_to_library(cb)

func fill_library_from_level():
	if not GameData.is_level_data_set():
		fill_library()
		return
	
	var available_instructions = GameData.get_value_or_null("available_instructions")
	print("available_instructions: " + str(available_instructions))
	if available_instructions == null:
		fill_library()
		return
	
	for instruction in available_instructions:
		var cb = CodeBlocks.get_code_block(instruction)
		add_to_library(cb)

func add_to_library_from_dict(label: String, color: Color, has_input: bool = false):
	var cb = code_block_scene.instantiate()
	cb.set_background_color(color)
	cb.set_label(label)
	cb.set_input_visibility(has_input)

	add_to_library(cb)

func add_to_library(cb: CodeBlock):
	cb.add_to_group("library_code_blocks")
	%CodeLibrary.add_child(cb)


func set_width(_width: int):
	width = _width
	var HSplit = %CodePanel.get_node("MarginContainer").get_node("HSplitContainer")
	HSplit.split_offset = code_library.size.x - width


func open_panel():
	visible = true
	%ButtonHideShow.text = "❮"

func close_panel():
	visible = false
	%ButtonHideShow.text = "❯"
	
func _on_button_hide_show_pressed():
	is_open = !is_open
	if is_open: open_panel()
	else: close_panel()
