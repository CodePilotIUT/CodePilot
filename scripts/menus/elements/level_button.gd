extends Control


func _on_button_pressed():
	var level_path = self.get_meta("level_path")
	GameData.set_level_path(level_path)
	get_tree().change_scene_to_file("res://scenes/ingame/ingame.tscn")
	print("Button pressed with path: " + level_path)

func set_level_number(num: int):
	var label = %LevelNumber
	label.text = str(num)

func get_level_number() -> int:
	return %LevelNumber.text.to_int()

func set_level_path(path: String):
	self.set_meta("level_path", path)

func get_level_path() -> String:
	return self.get_meta("level_path")

func set_star1(is_full: bool):
	var star = %Star1
	if is_full:
		star.texture = load("res://resources/2D Textures/star_full.png")
	else:
		star.texture = load("res://resources/2D Textures/star_empty.png")

func set_star2(is_full: bool):
	var star = %Star2
	if is_full:
		star.texture = load("res://resources/2D Textures/star_full.png")
	else:
		star.texture = load("res://resources/2D Textures/star_empty.png")


func _on_mouse_entered():
	self.scale = Vector2(1.01, 1.01)

func _on_mouse_exited():
	self.scale = Vector2(1, 1)
