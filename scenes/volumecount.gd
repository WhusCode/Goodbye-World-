extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var hslider = get_parent().get_node("HSlider") # Adjust path as needed
	if hslider:
		text = str(hslider.value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_music_volume_silde_value_changed(value: float) -> void:
	text = str(value)
