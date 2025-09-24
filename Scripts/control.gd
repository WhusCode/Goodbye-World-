extends Control


func _process(_delta):
	pass
	
func _ready() -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn") # Replace with function body.
	#AudioController.play_track_by_file("res://MusicFiles/Dragon Smasher.mp3")


func _on_quit_pressed() -> void:
	get_tree().quit() #Replace with function body.


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn") 


func _on_version_notes_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/version_notes.tscn") 
