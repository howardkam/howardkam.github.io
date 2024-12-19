extends CharacterBody2D

# Movement parameters
@export var move_speed: float = 200.0
@export var jump_force: float = 500.0
@export var gravity: float = 900.0
@export var max_fall_speed: float = 1500.0
@export var bounce_force: float = 200.0  # Adjust bounce intensity
@onready var cpu_particles = $CPUParticles2D
var push_force = 100


func _physics_process(delta: float) -> void:
	# Handle horizontal movement
	var input_direction: float = Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.x = input_direction * move_speed

	# Rotate based on movement direction
	if input_direction != 0:
		rotation += input_direction * 5.0 * delta  # Adjust rotation speed as needed

	# Apply gravity and limit fall speed
	if not is_on_floor():
		velocity.y = min(velocity.y + gravity * delta, max_fall_speed)

	# Add bounce when hitting the ground
	if is_on_floor() and velocity.y > 0:
		velocity.y = -bounce_force

	# Jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	# Rigidbody push collision
	for i in range(get_slide_collision_count()):
		var c = get_slide_collision((i))
		if c.get_collider() is RigidBody2D:
			var push_direction = -c.get_normal()
			var force = push_direction * push_force
			c.get_collider().apply_central_impulse(force)
	# Move the character
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("death") or  area.is_in_group("torpedo"):
		$Hexagon2.visible = false
		cpu_particles.one_shot = true
		cpu_particles.emitting = true
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(2).timeout
		SceneManager.reload_scene({ "speed": 2 })
