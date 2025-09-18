extends Control


func _process(_delta):
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/survivorsgame.tscn") # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit() #Replace with function body.


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/917credits.tscn") 


func _on_version_notes_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/917version_notes.tscn") 
