extends Node2D

@export var platform_count: int = 2000
@export var platform_width_range: Vector2i = Vector2i(100, 400)  # Min and Max width of platforms
@export var platform_height: int = 50  # Height of the platform
@export var map_size: Vector2i = Vector2i(15000, 3000)  # Map size
@export var vertical_probability: float = 0.2  # Probability that a platform is vertical

@onready var circle_scene = preload("res://Characters/circle.tscn")

# Platform scene to instance
@onready var platform_scene: PackedScene = preload("res://Platform.tscn")

func _ready():
	randomize()  # Ensure different results each run
	generate_platforms()

func _process(delta):
	if randi() % 10 == 0: # spawn every 10 seconds
		var x_pos = randf_range(1000, 15000) # random X position between 1000 and 15000
		var instance = circle_scene.instantiate()
		instance.position.x = x_pos
		instance.position.y = 0 # always at Y=0
		add_child(instance)


func generate_platforms():
	var occupied_areas = []  # Track occupied areas to prevent overlaps

	for i in platform_count:
		var platform_instance = platform_scene.instantiate()

		# Randomize the orientation of the platform
		var is_vertical = randf() < vertical_probability
		var platform_width = randf_range(platform_width_range.x, platform_width_range.y)
		var platform_height_actual = platform_height

		if is_vertical:
			# Swap width and height for vertical platforms
			platform_instance.scale = Vector2(platform_height / 100.0, platform_width / 100.0)
			platform_height_actual = platform_width
			platform_width = platform_height
		else:
			platform_instance.scale = Vector2(platform_width / 100.0, platform_height / 100.0)

		# Attempt to find a non-overlapping position
		var max_attempts = 50
		var attempts = 0
		var x_position = 0.0
		var y_position = 0.0
		var valid_position = false

		while not valid_position and attempts < max_attempts:
			x_position = randf_range(0, map_size.x - platform_width)
			y_position = randf_range(0, map_size.y - platform_height_actual)
			valid_position = true

			for area in occupied_areas:
				if x_position < area.position.x + area.size.x and x_position + platform_width > area.position.x and y_position < area.position.y + area.size.y and y_position + platform_height_actual > area.position.y:
					valid_position = false
					break

			attempts += 1

		if not valid_position:
			print("Could not place platform after max attempts. Skipping...")
			continue

		# Mark this platform's area as occupied
		occupied_areas.append(Rect2(Vector2(x_position, y_position), Vector2(platform_width, platform_height_actual)))
		platform_instance.position = Vector2(x_position, y_position)

		# Add the platform to the scene tree
		add_child(platform_instance)
