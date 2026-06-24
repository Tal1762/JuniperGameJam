extends RigidBody3D

@export var stability_factor:float = .7
@export var terminal_velocity:float = 15.0
@export var velocity:float = 15.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_torque(Vector3(0, 10000, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	#pass
	apply_torque(Vector3(0, 10, 0))
	friction()
	movement()
	gyroscopic_forces()
	
	if (abs(linear_velocity.x) > terminal_velocity):
		linear_velocity.x = sign(linear_velocity.x) * 10
	

func gyroscopic_forces() -> void:
	var spin_speed:float = abs(angular_velocity.y)
	var rel_up = transform.basis.y
	var up_torque = rel_up.cross(Vector3.UP)
	var gyro_torque = up_torque * spin_speed * stability_factor
	apply_torque(gyro_torque)
	
func movement() -> void:
	if Input.is_action_pressed("left"):
		apply_central_force(Vector3(-velocity, 0 ,0))
	if Input.is_action_pressed("right"):
		apply_central_force(Vector3(velocity, 0 ,0))
	
func friction() -> void:
	if linear_velocity.x == 0:
		return
	if abs(linear_velocity.x) < 0.1:
		linear_velocity.x = 0
	apply_central_force(Vector3(-10 * linear_velocity.x / 7, 0 ,0))
