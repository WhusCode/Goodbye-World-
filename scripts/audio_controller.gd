extends Node
var music_playing: bool = false #sets  music as not playing
@onready var music: AudioStreamPlayer = $Music

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_title():
	AudioController.music_playing = true
	play_track_by_file("res://MusicFiles/Dragon Smasher.mp3")
	music.volume_db = -10

func play_track_by_file(file: String): 
	music.stop()
	music.stream = load(file)
	music.play()
	
func stop_music():
	AudioController.music_playing = false
	music.stop()


func _on_music_finished() -> void:
	play_track_by_file("res://Audio/CaedisTitle.mp3")
