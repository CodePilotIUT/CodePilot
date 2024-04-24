@tool

extends Node3D

@onready var grid_map : GridMap =  $GridMap

func _ready():
	generate()
	
var x_size = 15
var y_size = 15
var maxRouteX = floor(round(x_size / 2 - 1))
var maxRouteY = floor(round(y_size / 2 - 1))

func generate():
	grid_map.clear()
	var routes = generate_routes(x_size, y_size)
	grid_map.set_cell_item(Vector3i(0, 0, 0), 1)
	for i in range(x_size):
		for j in range(y_size):
			if routes[i][j] == 1:
				grid_map.set_cell_item(Vector3i(i, 0, j), 9)
			else:
				grid_map.set_cell_item(Vector3i(i, 0, j), 3)

func generate_routes(x, y):
	# Initialisation des tableaux
	var routes = []
	var starting_routes = []

	for i in range(y):
		routes.append([])
		for j in range(x):
			routes[i].append(0)

	# Placement de la ligne verticale centrée
	for i in range(1, y - 1):
		routes[i][x / 2] = 1

	# Placement de la ligne horizontale centrée
	for j in range(1, x - 1):
		routes[y / 2][j] = 1

	# Remplissage du tableau starting_routes
	for i in range(1, y - 1):
		for j in range(1, x - 1):
			if routes[i][j] == 1 and (i != y / 2 or j != x / 2):
				if not ((i - 1 <= y / 2) and ( y / 2 <= i + 1) and (j - 1 <= x / 2) and (x / 2 <= j + 1)):
					starting_routes.append(Vector2(i, j))

	# Création des tableaux horizontal_routes et vertical_routes
	var horizontal_routes = []
	var vertical_routes = []

	for route in starting_routes:
		if route.x == y / 2:
			vertical_routes.append(route)
		if route.y == x / 2:
			horizontal_routes.append(route)
			


	
	for a in range(len(routes)):
		print(routes[a])
	return routes


