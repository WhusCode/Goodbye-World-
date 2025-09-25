extends Control


func _process(_delta):
	pass
	
func _ready() -> void:
	if (AudioController.music_playing == false):
		AudioController.play_track_by_file("res://MusicFiles/Does This Sound Minecraft Enough.mp3")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	AudioController.play_track_by_file("res://MusicFiles/A Thousand Archives, Forever Lost to Time.mp3")



func _on_quit_pressed() -> void:
	get_tree().quit() #Replace with function body.


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn") 


func _on_version_notes_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/version_notes.tscn") 


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn") 
