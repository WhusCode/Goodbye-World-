extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

var health = 100
var player_inattack_zone = false
var can_take_dmg = true

func _physics_process(delta):
	deal_with_dmg()
	
	if player_chase:
		if position.distance_to(player.position) > 10:
			position+=(player.position-position)/speed
			$AnimatedSprite2D.play("side_walk")
			if (player.position.x-position.x)<0:
				$AnimatedSprite2D.flip_h=true
			else:
				$AnimatedSprite2D.flip_h=false
	else:
		$AnimatedSprite2D.play("idle")
	move_and_slide()

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false

func deal_with_dmg():
	if player_inattack_zone and Global.player_current_attack == true:
		if can_take_dmg == true:
			health = health - 20
			$take_dmg_cd.start()
			can_take_dmg = false
			if health <= 0:
				self.queue_free()
				#$AnimatedSprite2D.play("death")


func _on_take_dmg_cd_timeout():
	can_take_dmg = true
