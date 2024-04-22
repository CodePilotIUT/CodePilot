extends Container

var code_block_scene = preload("res://scenes/ingame/elements/code_block.tscn")

func _ready():
	populate_randomly(15)

func populate_randomly(size):
	for i in range(size):
		var cb = code_block_scene.instantiate()
		$CodeEditor.add_child(cb)
		
		# Chose random color
		var r = randf()
		var g = randf()
		var b = randf()
		cb.get_node("background").modulate = Color(r,g,b)
		
		# Put random strings
		var line = ""
		for j in range(randi_range(3, 10)):
			line += str(i) + " "
		line.erase(line.length() - 1, 1)
		set_label(cb, line)
		
		# Show randomly the input box
		cb.get_node("%Input").visible = randi_range(0, 1)

func set_label(cb, label):
	cb.get_node("%Label").text = label

func get_label(cb):
	return cb.get_node("%Label").text

func _on_button_pressed():
	var list = get_list_string()
	print(list)

func get_list_string():
	var list = []
	for child in $CodeEditor.get_children():
		var text = get_label(child)
		list.append(text)
	return list
