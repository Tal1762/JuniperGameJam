extends Area3D

@export var speed_inc = 80

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(top: Top) -> void:
	top.inc_pseudo_speed(speed_inc)
