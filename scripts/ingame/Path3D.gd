extends Path3D

const move_speed = 10.0
const path_scale = 2

func _ready(): pass

func draw_path_from_2D(path: Array[Vector2]):
	curve.clear_points()
	for point in path:
		point *= path_scale
		point += Vector2(1, 1)
		curve.add_point(Vector3(point.x, 0, point.y))

func _process(delta: float):
	$PathFollow3D.progress += move_speed * delta
