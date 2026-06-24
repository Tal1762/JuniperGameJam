extends RigidBody3D

@export var stability_factor: float = .7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_constant_force(Vector3(10, 0 ,0))
<<<<<<< HEAD
	body.apply_torque(Vector3(0, 10000, 0))
=======
	#body.apply_torque(Vector3(0, 10000, 0))
>>>>>>> 16064e77baeb5e5feb4bcc3adcf226b7421b0e86
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	#pass
	apply_torque(Vector3(0, 100, 0))
	gyroscopic_forces()
	apply_central_force(Vector3(10, 0 ,0))
	

func gyroscopic_forces() -> void:
	var spin_speed:float = abs(angular_velocity.y)
	var rel_up = transform.basis.y
	var up_torque = rel_up.cross(Vector3.UP)
	var gyro_torque = up_torque * spin_speed * stability_factor
	apply_torque(gyro_torque)
	
