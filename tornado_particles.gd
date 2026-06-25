extends GPUParticles3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
@export var tornadoparticles:TorusMesh
var inc_rad = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inc_rad:
		tornadoparticles.inner_radius += 0.001
		tornadoparticles.outer_radius += 0.001
	else:
		tornadoparticles.inner_radius -= 0.001
		tornadoparticles.outer_radius -= 0.001
	if tornadoparticles.inner_radius > 0.8 or tornadoparticles.outer_radius > 0.8:
		inc_rad = false
	if tornadoparticles.inner_radius < 0.60 or tornadoparticles.outer_radius < 0.60:
		inc_rad = true
	
	
