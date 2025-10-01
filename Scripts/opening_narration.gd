extends Node2D

func _ready():
	var opening_narr = Dialogic.start('OpeningNarrTL')
	add_child(opening_narr)

func _on_timeline_ended(): #CURRENTLY NOT WORKING -- i dont know how to properly do signal code sorryyyy
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
