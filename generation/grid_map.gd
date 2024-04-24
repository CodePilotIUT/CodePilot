@tool

extends Node3D

@onready var grid_map : GridMap =  $GridMap


func _ready():
	generate()

func generate():
	grid_map.clear()
	for i in range(0, 10):
		for j in range(0, 10):
			grid_map.set_cell_item(Vector3i(i, 0, j), 3)
