extends CanvasLayer



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	AudioController.play_track_by_file("res://MusicFiles/A Thousand Archives, Forever Lost to Time.mp3")
