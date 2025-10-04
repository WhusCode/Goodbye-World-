extends Control



@onready var main = $world.tscn
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _on_resume_pressed() -> void:
	main.PauseMenu()# Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit() # Replace with function body.
