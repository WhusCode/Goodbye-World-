extends Node2D

@onready var pause_menu = $player/PauseMenu
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.PlayerInput = false
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start('OpeningNarrTL')
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused

func _on_dialogic_signal(argument: String): #CURRENTLY NOT WORKING -- i dont know how to properly do signal code sorryyyy
	if argument == "OpeningDone":
		Global.PlayerInput = true	
