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
	
	populate_randomly(15)

func _process(_delta): pass

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
		
		add_to_library(line, Color(r,g,b), has_input)

func add_to_library(label: String, color: Color, has_input: bool = false):
	var cb = code_block_scene.instantiate()
	cb.set_background_color(color)
	cb.set_label(label)
	cb.set_input_visibility(has_input)
	cb.add_to_group("library_code_blocks")
	
	%CodeLibrary.add_child(cb)


func set_width(_width: int):
	width = _width
	var HSplitContainer = %CodePanel.get_node("MarginContainer").get_node("HSplitContainer")
	HSplitContainer.split_offset = code_library.size.x - width


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
