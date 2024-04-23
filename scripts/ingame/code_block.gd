class_name CodeBlock

extends Control

var code_editor

func _ready():
	code_editor = get_tree().root.get_node("IngameUI/HSplitContainer/CodePanel/MarginContainer/HSplitContainer/CodeEditorPanel")
	
func _process(_delta): pass


func set_label(label: String) -> void:
	get_node("%Label").text = label

func get_label() -> String:
	return get_node("%Label").text

func set_background_color(color: Color) -> void:
	get_node("background").modulate = color

func get_background_color() -> Color:
	return get_node("background").modulate

func set_input_visibility(activated: bool) -> void:
	get_node("%Input").visible = activated

func get_input_visibility() -> bool:
	return get_node("%Input").visible

func has_input() -> bool: return get_input_visibility()

func set_input(input: String) -> void:
	get_node("%Input").text = input

func get_input() -> String:
	return get_node("%Input").text


func _on_button_input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				if is_in_group("library_code_blocks"):
					var cb = self.duplicate()
					cb.remove_from_group("library_code_blocks")
					code_editor.add_code_block(cb)
	
			MOUSE_BUTTON_RIGHT:
				if is_in_group("editor_code_blocks"):
					code_editor.del_code_block(self)


func _on_mouse_entered():
	self.scale = Vector2(1.01, 1.01)

func _on_mouse_exited():
	self.scale = Vector2(1, 1)
