extends AudioStreamPlayer

@export var max_volume_distance: float = 100.0  # Maximum distance for full volume
@export var min_volume_distance: float = 10.0  # Minimum distance for any volume
@onready var player = "res://Characters/player.tscn"

func _process(delta: float):
	if not is_playing():
		return
	
	# Get distance to the player (assume player node is named "Player")
	if not player:
		return
	
	var distance = global_position.distance_to(player.global_position)
	
	# Calculate volume based on distance
	if distance < min_volume_distance:
		volume_db = 0.0  # Full volume
	elif distance > max_volume_distance:
		volume_db = -80.0  # Essentially mute
	else:
		# Linearly interpolate between min and max distances
		var t = (distance - min_volume_distance) / (max_volume_distance - min_volume_distance)
		volume_db = lerp(0.0, -80.0, t)  # Adjust volume curve as needed
	
	# Apply volume
	self.volume_db = volume_db
