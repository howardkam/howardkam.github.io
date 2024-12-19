extends Node2D
@signal checkpoint_activated(position, data)

func _on_area_entered(body):
	if body.name == "Player":  # Ensure it's the player
		emit_signal("checkpoint_activated", self.global_position, save_game_state())

func save_game_state() -> Dictionary:
	# Customize to save game-specific data
	return {
		"player_health": body.health,
		"player_inventory": body.inventory,
		"player_score": body.score
	}
