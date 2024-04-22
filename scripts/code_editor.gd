extends Container

func _ready():
	var code_block_scene = preload("res://scenes/code_block.tscn")
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
