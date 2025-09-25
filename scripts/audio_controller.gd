extends Node
var music_playing: bool = false #sets  music as not playing
var musicvolume: float = -15
@onready var music: AudioStreamPlayer = $Music

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(float) -> void:
	music.volume_db = musicvolume


func play_track_by_file(file: String): 
	music.stop()
	music_playing = true
	music.volume_db = musicvolume
	music.stream = load(file)
	music.play()
	
func stop_music():
	AudioController.music_playing = false
	music.stop()


func _on_music_finished() -> void:
	music_playing = false
