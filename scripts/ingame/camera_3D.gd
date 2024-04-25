extends Camera3D
 
@onready var noise = FastNoiseLite.new()
 
@export var amplitude : float = 10.0
 
var trauma = 0.3
var trauma_power = 2
var NOISE_SPEED = 0.05
var _noise_y = 0
 
func _ready():
	randomize()
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
 
func _physics_process(delta):
	if trauma:
		trauma = max(trauma, 0)
		_noise_y += NOISE_SPEED
		_shake()
 
func add_trauma(amount: float):
	trauma = min(trauma + amount, 1.0)
 
func _shake():
	var amount = pow(trauma,trauma_power)
	h_offset =  amplitude * amount * noise.get_noise_2d(noise.seed,_noise_y)
	v_offset =  amplitude * amount * noise.get_noise_2d(noise.seed*2,_noise_y)
	
