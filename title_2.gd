extends StaticBody2D
@onready var hexagon = $Hexagon2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Adjust the rotation speed
	var rotation_speed = 0.1  # Radians per second
	# Increment the rotation
	hexagon.rotation += rotation_speed * delta
	await get_tree().create_timer(5).timeout
	SceneManager.change_scene("res://Worlds/world_1.tscn")
