extends Panel

@onready var map_dynamique = %MapDynamique
@onready var path_3D = map_dynamique.find_child("Path3D")

func _ready():
	init()

func init():
	if GameData.is_level_data_set():
		# init the car position
		path_3D.tp_to(Vector2(0, 1))
		print(path_3D.get_current_coords_in_grid())
	else:
		print("Level data not set")

func _on_start_button_pressed():
	init()
	path_3D.go_to(Vector2(14, 13))
