extends Node3D

@export var body:RigidBody3D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body.add_constant_torque(Vector3(0, 200, 0))
	body.add_constant_force(Vector3(10, 0 ,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
