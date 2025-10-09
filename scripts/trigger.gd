extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



	
func _on_dialogic_signal(argument: String): #CURRENTLY NOT WORKING -- i dont know how to properly do signal code sorryyyy
	if argument == "BossTrigger":
		Global.PlayerInput = true	
	queue_free()

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("PlayerGroup"):
		Global.PlayerInput = false
		Dialogic.signal_event.connect(_on_dialogic_signal)
		Dialogic.start("res://Dialogue/Timelines/CassandraBossFight.dtl")
