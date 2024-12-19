extends CPUParticles2D

# Speed of the camera's movement
@export var move_speed: float = 70

func _process(delta: float) -> void:
	pass
	## Move the camera to the right
	#if position.x < 11000.0:
		#position.x += move_speed * delta
	#else:
		## Stop moving when the camera reaches 10,000 pixels
		#position.x = 11000.0
