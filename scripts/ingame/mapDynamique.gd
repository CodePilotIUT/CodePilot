@tool

extends Node3D

@onready var grid_map : GridMap =  $GridMap

const orientations = [0, 10, 16, 22]

func randomOrientation():
	return orientations[randi_range(0, 3)]

func _ready():
	var level = GameData.get_value_or_null("level")
	if level == null:
		level = []
	
	for i in range(len(level)):
		for j in range(len(level[0])):

			# 0 = Batiment
			if level[i][j] == 0:
				var batiment = randi_range(0, 7)
				grid_map.set_cell_item(Vector3i(i, 0, j), batiment, randomOrientation())
			
			# 1 = Route
			elif level[i][j] == 1:
				var road = get_road_type_and_orientation(i, j, level)
				var road_type = road[0]
				var road_orientation = orientations[road[1]]
				grid_map.set_cell_item(Vector3i(i, 0, j), road_type, road_orientation)

func get_adjacent_roads(x, y, level):
	"""Get the adjacent roads of a cell in the level."""
	var roads = {
		'x-': (x > 0 and level[x - 1][y] == 1),
		'x+': (x < len(level) - 1 and level[x + 1][y] == 1),
		'y-': (y > 0 and level[x][y - 1] == 1),
		'y+': (y < len(level[0]) - 1 and level[x][y + 1] == 1)
	}
	return roads

func get_road_type_and_orientation(x, y, level):
	"""Get the road type and orientation of a cell in the level."""
	var roads = get_adjacent_roads(x, y, level)
	
	# 4 ways
	if roads['x-'] and roads['x+'] and roads['y-'] and roads['y+']:
		return [9, 0]
	
	# 3 ways
	elif roads['x-'] and roads['x+'] and roads['y-']:
		return [11, 2]
	elif roads['x-'] and roads['x+'] and roads['y+']:
		return [11, 3]
	elif roads['x-'] and roads['y-'] and roads['y+']:
		return [11, 1]
	elif roads['x+'] and roads['y-'] and roads['y+']:
		return [11, 0]
	
	# 2 ways - Straight
	elif roads['x-'] and roads['x+']:
		return [10, 2]
	elif roads['y-'] and roads['y+']:
		return [10, 0]

	# 2 ways - Corner	
	elif roads['x-'] and roads['y-']:
		return [8, 1]
	elif roads['x-'] and roads['y+']:
		return [8, 3]
	elif roads['x+'] and roads['y-']:
		return [8, 2]
	elif roads['x+'] and roads['y+']:
		return [8, 0]
	
	# 1 way (dead end)
	elif roads['x-']:
		return [10, 2]
	elif roads['x+']:
		return [10, 2]
	elif roads['y-']:
		return [10, 0]
	elif roads['y+']:
		return [10, 0]
	
	# other
	else:
		return [9, 0]
	
