extends Area2D
@export var speed: float = randf_range(50,70)
@onready var player = $Player
@onready var cpu_particles = $explosion
@onready var trail = $trail
@onready var marker = $Marker2D


var target_position = Vector2.ZERO
func _process(delta: float) -> void:
	# Find the nearest enemy node
	var nearest_enemy = _find_nearest_enemy()
	if nearest_enemy:
		target_position = nearest_enemy.global_position

	# Move the torpedo towards the target position
	if global_position.distance_to(target_position) > 5:  # Stop near the target
		var direction = (target_position - global_position).normalized()
		global_position += direction * speed * delta
func _find_nearest_enemy() -> Node2D:
	# Get all enemy nodes in the scene
	var enemies = get_tree().get_nodes_in_group("Player")
	var nearest_enemy: Node2D = null
	var shortest_distance = INF

	for enemy in enemies:
		if enemy is Node2D:
			var distance = global_position.distance_to(enemy.global_position)
			if distance < shortest_distance:
				shortest_distance = distance
				nearest_enemy = enemy

	return nearest_enemy

func _on_body_entered(body: Node2D) -> void:
	pass


func _on_timer_timeout() -> void:
	print("Torpedo died")
	$AudioStreamPlayer2D2.play()
	cpu_particles.one_shot = true
	cpu_particles.emitting = true
	trail.queue_free()
	await get_tree().create_timer(1).timeout
	queue_free() # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		print("explode")
		await get_tree().create_timer(1).timeout
		queue_free() # Replace with function body.
