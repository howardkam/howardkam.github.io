extends Node2D

@onready var torpedo_scene = preload("res://Characters/torpedo.tscn")
@onready var marker = $Marker2D  # Reference the Marker2D node
var has_spawned: bool = false  # Flag to track if the torpedo has been spawned

func _ready() -> void:
	# Connect the "area_entered" signal to the _on_area_2d_area_entered method
	$Area2D.connect("area_entered", Callable(self, "_on_area_2d_area_entered"))

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player") and not has_spawned:  # Check if the torpedo has already been spawned
		has_spawned = true  # Set the flag to true
		var torpedo_instance = torpedo_scene.instantiate()
		torpedo_instance.position.y = 0
		add_child(torpedo_instance)  # Add the torpedo to the current scene
