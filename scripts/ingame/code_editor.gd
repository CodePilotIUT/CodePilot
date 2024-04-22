extends Container

func _ready():
	var code_block_scene = preload("res://scenes/ingame/elements/code_block.tscn")
	for i in range(10):
		var cb = code_block_scene.instantiate()
		$CodeEditor.add_child(cb)
		
		var r = randf()
		var g = randf()
		var b = randf()
		cb.get_node("ColorRect").color = Color(r,g,b)
		
		set_label(cb, str(i))

func set_label(cb, label):
	cb.get_node("ColorRect").get_node("MarginContainer").get_node("Label").text = label


func _on_button_pressed():
	var list = get_list_string()
	print(list)

func get_list_string():
	var list = []
	for child in $CodeEditor.get_children():
		var text = child.get_node("ColorRect").get_node("MarginContainer").get_node("Label").text
		list.append(text)
	return list
