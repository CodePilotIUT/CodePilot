@tool

extends Node3D

@onready var grid_map : GridMap =  $GridMap

func randomOrientation():
	var nbr = randf()
	if nbr <= 0.25:
		return 0
	elif nbr <= 0.5:
		return 10
	elif nbr <= 0.75:
		return 16
	elif nbr <= 1:
		return 22
# Called when the node enters the scene tree for the first time.
func _ready():
	var file = "res://levels/level_2.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json = JSON.parse_string(json_as_text)
	var level = json["level"]
	print(level)
	
	for i in range(len(level)):
		for j in range(len(level[0])):
			if level[i][j] == 0:
				var batiment = round(randf()*7)
				grid_map.set_cell_item(Vector3i(i, 0, j), batiment, randomOrientation())
			else:
				grid_map.set_cell_item(Vector3i(i, 0, j), 9)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
