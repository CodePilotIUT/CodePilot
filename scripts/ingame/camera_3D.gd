extends Camera3D
 
@onready var noise_h = FastNoiseLite.new()
@onready var noise_v = FastNoiseLite.new()
 
var amount = 1
var NOISE_SPEED = 10
var noise_progress = 0
 
func _ready():
	h_offset = 0
	v_offset = 0

	randomize()
	noise_h.seed = randi()
	noise_h.noise_type = FastNoiseLite.TYPE_PERLIN
	noise_v.seed = randi()
	noise_v.noise_type = FastNoiseLite.TYPE_PERLIN
 
func _process(delta):
	noise_progress += NOISE_SPEED * delta
	_shake()
 
func _shake():
	h_offset = amount * noise_h.get_noise_1d(noise_progress)
	v_offset = amount * noise_v.get_noise_1d(noise_progress)
	print(h_offset, v_offset)
	
