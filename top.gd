extends RigidBody3D

@export var body:RigidBody3D;
@export var stability_factor: float = .7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	add_constant_force(Vector3(10, 0 ,0))
	body.apply_torque(Vector3(0, 10000, 0))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	#pass
	body.apply_torque(Vector3(0, 100, 0))
	gyroscopic_forces()

func gyroscopic_forces() -> void:
	var spin_speed:float = abs(body.angular_velocity.y)
	var rel_up = body.transform.basis.y
	var up_torque = rel_up.cross(Vector3.UP)
	var gyro_torque = up_torque * spin_speed * stability_factor
	body.apply_torque(gyro_torque)
	
