extends Path3D

@onready var audio_player_car: AudioStreamPlayer = %AudioStreamPlayer_Car
@onready var audio_player_bg: AudioStreamPlayer = %AudioStreamPlayer_BG

const move_speed: float = 20
const path_scale: float = 2

var moving: bool = false

func _ready(): pass


# Conversion entre les coordonnées du monde et les coordonnées du tableau

func grid2world_coords(array_coords: Vector2) -> Vector3:
	"""Convert array coordinates to world coordinates"""
	var shift = Vector2(path_scale/2, path_scale/2)
	var array_coords_to_scale = array_coords * path_scale + shift
	return Vector3(array_coords_to_scale.x, 0, array_coords_to_scale.y)

func world2grid_coords(world_coords: Vector3) -> Vector2:
	"""Convert world coordinates to array coordinates"""
	var shift = Vector2(path_scale/2, path_scale/2)
	var world_coords_to_scale = Vector2(world_coords.x, world_coords.z) - shift
	var array_coords = world_coords_to_scale / path_scale

	# Arrondir les coordonnées en entiers
	array_coords.x = int(array_coords.x)
	array_coords.y = int(array_coords.y)

	return array_coords


func find_path(grid, start, end):
	"""Find a path from start to end in the grid using A* algorithm"""
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


func draw_path_from_2D(path: Array[Vector2]):
	"""Draw the path in 3D from a list of 2D coordinates"""
	curve.clear_points()
	for point_2d in path:
		var point_3d = grid2world_coords(point_2d)
		curve.add_point(point_3d)


func get_current_coords_in_grid() -> Vector2:
	"""Get the current coordinates of the player in the grid"""
	return world2grid_coords($PathFollow3D.global_transform.origin)

func go_to(coords: Vector2):
	var start = get_current_coords_in_grid()
	print("Going from ", start, " to ", coords)
	var grid = GameData.get_value_or_null("level")
	if grid != null:
		print("Grid found")
		var path = find_path(grid, start, coords)
		print("Path found: ", path)
		draw_path_from_2D(path)
		moving = true

func tp_to(coords: Vector2):
	"""Teleport the player to the given coordinates"""
	var world_coords = grid2world_coords(coords)
	$PathFollow3D.global_transform.origin = world_coords
	
func _process(delta: float):
	if moving:
		var new_progress = $PathFollow3D.progress + move_speed * delta
		if new_progress < curve.get_baked_length():
			$PathFollow3D.progress = new_progress
			
		# Si on a atteint la fin du chemin
		else:
			moving = false
			$PathFollow3D.progress_ratio = 1
			curve.clear_points()
	
	# Jouer le son si la voiture est en mouvement
	if moving and not audio_player_car.playing:
		audio_player_car.play()
	elif not moving and audio_player_car.playing:
		audio_player_car.stop()
