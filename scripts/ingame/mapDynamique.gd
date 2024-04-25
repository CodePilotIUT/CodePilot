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

func _ready():
	var level = GameData.get_value_or_null("level")
	if level == null:
		level = []
	
	for i in range(len(level)):
		for j in range(len(level[0])):
			if level[i][j] == 0:
				var batiment = round(randf()*7)
				grid_map.set_cell_item(Vector3i(i, 0, j), batiment, randomOrientation())
			else:
				grid_map.set_cell_item(Vector3i(i, 0, j), 9)
