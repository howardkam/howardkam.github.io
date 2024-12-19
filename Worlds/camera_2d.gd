extends Camera2D
@onready var player = $"../Player"
# Speed of the camera's movement
@export var move_speed: float = 50.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("camerafocus"):
		position.x = player.position.x
	# Move the camera to the right
	if position.x < 20000.0:
		position.x += move_speed * delta
	else:
		# Stop moving when the camera reaches 10,000 pixels
		position.x = 20000.0
