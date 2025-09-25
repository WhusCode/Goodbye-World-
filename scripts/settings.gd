extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MusicVolumeSilde.value = AudioController.musicvolume

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")


func _on_h_slider_value_changed(value: float) -> void:
	AudioController.musicvolume = value
