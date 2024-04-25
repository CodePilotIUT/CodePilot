extends Panel

@onready var map_dynamique = %MapDynamique
@onready var path_3D = map_dynamique.find_child("Path3D")

func _ready():
	if GameData.is_level_data_set():
		var map = GameData.get_value("level")
		var path = find_path(map, Vector2(0, 1), Vector2(14, 13))
		print(path)
		
		path_3D.draw_path_from_2D(path)
	else:
		print("Level data not set")

func find_path(grid, start, end):
	var astar = AStar2D.new()
	var width = grid.size()
	var height = grid[0].size()

	# Ajouter les nœuds
	for x in range(width):
		for y in range(height):
			if grid[x][y] == 1:  # Seulement les routes
				var id = x * height + y
				astar.add_point(id, Vector2(x, y))

	# Connecter les nœuds aux voisins
	var directions = [Vector2(0, 1), Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0)]
	for x in range(width):
		for y in range(height):
			if grid[x][y] == 1:
				var current_id = x * height + y
				for direction in directions:
					var neighbour = Vector2(x, y) + direction
					if neighbour.x >= 0 and neighbour.y >= 0 and neighbour.x < width and neighbour.y < height:
						if grid[int(neighbour.x)][int(neighbour.y)] == 1:
							var neighbour_id = int(neighbour.x) * height + int(neighbour.y)
							astar.connect_points(current_id, neighbour_id)

	# Calcul du chemin
	var start_id = start.x * height + start.y
	var end_id = end.x * height + end.y
	var path = astar.get_point_path(start_id, end_id)
	
	return path


func _process(delta):
	pass
