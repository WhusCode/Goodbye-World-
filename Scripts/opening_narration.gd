extends Node2D

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	var opening_narr = Dialogic.start('OpeningNarrTL')
	add_child(opening_narr)

func _on_dialogic_signal(argument: String): #CURRENTLY NOT WORKING -- i dont know how to properly do signal code sorryyyy
	if argument == "OpeningDone":
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
