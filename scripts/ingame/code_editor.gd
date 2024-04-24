extends Panel

const code_block_scene = preload("res://scenes/ingame/elements/code_block.tscn")
const code_block_script = preload("res://scripts/ingame/code_block.gd")

func _ready():
	populate_randomly(0)

func _process(_delta):
	# if there are code blocks (group "code_block"), hide EmptyMsg, otherwise show it
	if get_length() > 0:
		%EmptyMsg.hide()
	else:
		%EmptyMsg.show()

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

		add_new_code_block(line, Color(r, g, b), has_input)


func add_new_code_block(label: String, color: Color, has_input: bool = false, pos: int = -1):
	var cb = code_block_scene.instantiate()
	cb.set_background_color(color)
	cb.set_label(label)
	cb.set_input_visibility(has_input)
	
	add_code_block(cb, pos)

func add_code_block(cb: Control, pos: int = -1):
	cb.add_to_group("editor_code_blocks")
	cb.connect("gui_input", cb._on_button_input)
	%CodeEditor.add_child(cb)
	%CodeEditor.move_child(cb, pos)

func del_code_block_at(pos: int = -1):
	var cb = %CodeEditor.get_child(pos)
	cb.queue_free()

func del_code_block(cb: Control):
	cb.queue_free()


func _on_button_pressed():
	var code = get_code_as_string()
	print(code)

func get_list() -> Array[CodeBlock]:
	var list: Array[CodeBlock] = []
	for child: CodeBlock in %CodeEditor.get_children():
		if child.is_in_group("code_blocks"):
			list.append(child)
	return list

func get_list_string() -> Array[String]:
	var list: Array[String] = []
	for child: CodeBlock in get_list():
		var line = child.get_label()
		if child.has_input():
			line += " (%s)" % child.get_input()

		list.append(line)
	return list

func get_code_as_string() -> String:
	var code: String = ""
	for line in get_list_string():
		code += line + "\n"
	return code

func get_length() -> int:
	# get the number of code blocks (items in the group "code_block")
	var length: int = 0
	for child in %CodeEditor.get_children():
		if child.is_in_group("code_blocks"):
			length += 1
	return length


func clear():
	for child in %CodeEditor.get_children():
		child.queue_free()
