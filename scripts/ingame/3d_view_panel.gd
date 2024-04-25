extends Panel

@onready var map_dynamique = %MapDynamique
@onready var path_3D = map_dynamique.find_child("Path3D")

func _ready():
	if GameData.is_level_data_set():
		path_3D.tp_to(Vector2(0, 1))
		print(path_3D.get_current_coords_in_grid())

		# wait 3 seconds
		await get_tree().create_timer(3).timeout

		path_3D.go_to(Vector2(14, 13))
	else:
		print("Level data not set")
