extends Node2D
@onready var pause_menu = $player/Camera2D/PauseMenu
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_menu.hide()# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		PauseMenu()
		
func PauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
