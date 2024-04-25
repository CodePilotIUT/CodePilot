extends Path3D

const move_speed = 10.0


func _ready():
	var curviness = 30
	curve.add_point(Vector3(-10, 1, -10))
	curve.add_point(Vector3(10, 1, -10))
	curve.add_point(Vector3(10, 1, 10))
	curve.add_point(Vector3(-10, 1, 10))
	curve.add_point(Vector3(-10, 1, -10))

func _process(delta: float):
	$PathFollow3D.progress += move_speed * delta
