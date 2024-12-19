extends Node2D

var songs = [
	"res://audio/Hidden  Alex-Productions.mp3"
	#"res://audio/Burning Bridges  tubebackr.mp3",
	#"res://audio/Adventure  Lucjo.mp3"
]
var last_played_song = "" # Track the last played song
var audio_player: AudioStreamPlayer2D # Reference to the audio player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player = AudioStreamPlayer2D.new()
	add_child(audio_player)
	audio_player.attenuation = 0
	audio_player.max_distance = 10000

	# Connect the finished signal to play the next song
	audio_player.connect("finished", Callable(self, "_on_audio_finished"))
	
	play_random_song()
func play_random_song() -> void:
	var new_song = songs[randi() % songs.size()]
	while new_song == last_played_song:
		new_song = songs[randi() % songs.size()]
	
	audio_player.stream = load(new_song)
	audio_player.play()
	
	last_played_song = new_song
	print("Now playing:", new_song)

func _on_audio_finished() -> void:
	play_random_song()

# Seed the random number generator
func _init():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		SceneManager.change_scene("res://Worlds/world_2.tscn")
