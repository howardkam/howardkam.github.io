extends CharacterBody2D

@export var move_speed: float = 200.0
@export var jump_force: float = 500.0
@export var gravity: float = 980.0
@onready var sprite = $AnimatedSprite2D


# State variables
var is_jumping: bool = false

# Input handling
func _process(delta):
	var input_vector = Vector2.ZERO

	# Horizontal movement
	if Input.is_action_pressed("left"):
		sprite.play("walk")
		input_vector.x -= 1
		sprite.flip_h = true
	if Input.is_action_pressed("right"):
		sprite.play("walk")
		input_vector.x += 1
		sprite.flip_h = false

	velocity.x = input_vector.x * move_speed

	# Jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	# Idle
	if velocity.x == 0 and is_on_floor():
		sprite.play("idle")
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("left-death"):
		sprite.play("death")
		print('I have died')
		queue_free()
		get_tree().reload_current_scene()
