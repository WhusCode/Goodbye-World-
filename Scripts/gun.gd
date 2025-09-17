extends Area2D
var mana = 50.0

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
		
	if Input.is_action_pressed("BasicMagic") and (mana >= 3):
		mana -= 3
		shoot()
		
		
func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func restoremana():
	mana += 10

func _on_timer_timeout() -> void:
	restoremana() # Replace with function body.
