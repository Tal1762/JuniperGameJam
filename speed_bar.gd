extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var progress_bar = $ProgressBar
@onready var player = $Player  # The node with velocity

var max_speed = 400.0  # Maximum speed for full bar

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var speed = player.get_ang_y_vel()
	var progress_value = clamp((speed / max_speed) * 100, 0, 100)
	progress_bar.value = progress_value
