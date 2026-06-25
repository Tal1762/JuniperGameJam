extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var look_target: Node3D
@export var follow_speed: float = 5.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Smoothly move towards target position
	global_position = global_position.lerp(Vector3(look_target.global_position.x, position.y, position.z), follow_speed * delta)
