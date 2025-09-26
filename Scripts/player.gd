extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cd = true
var health = 200
var player_alive = true
var attack_ip = false
const speed = 100
var current_dir = "none"

func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	
func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	attack()
	
	if health <= 0:
		player_alive = false #add game over or respawn
		health = 0
		print("YOU DIED")
		self.queue_free()

func player_movement(delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed
		
		# Update animation direction based on last input
		if velocity.x > 0:
			current_dir = "right"
		elif velocity.x < 0:
			current_dir = "left"
		elif velocity.y > 0:
			current_dir = "down"
		elif velocity.y < 0:
			current_dir = "up"

		play_anim(1)
	else:
		play_anim(0)

	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("sideRun")
		elif movement == 0:
			if attack_ip == false:
				anim.play("sideIdle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("sideRun")
		elif movement == 0:
			if attack_ip == false:
				anim.play("sideIdle")
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("frontRun")
		elif movement == 0:
			if attack_ip == false:
				anim.play("frontIdle")
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("frontRun")
		elif movement == 0:
			if attack_ip == false:
				anim.play("frontIdle")

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false
		
func enemy_attack():
	if enemy_inattack_range and enemy_attack_cd == true:
		health = health - 20
		enemy_attack_cd = false
		$attack_cd.start()
		print(health)


func _on_attack_cd_timeout():
	enemy_attack_cd = true
	
func attack():
	var dir = current_dir
	
	if Input.is_action_just_pressed("attack"):
		Global.player_current_attack = true
		attack_ip = true
		if dir == "right":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side_attack")
			
		if dir == "left":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side_attack")
			
		if dir == "down":
			$AnimatedSprite2D.play("frontAttack")

		if dir == "up":
			$AnimatedSprite2D.play("back_attack")
			
		# play sword_slash audio wioth random pitch
		
		var pitch_range:float = randf_range(0.7, 1.3)
		$melee_swing.pitch_scale = pitch_range
		$melee_swing.play()
		$deal_attack_timer.start()



func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	Global.player_current_attack = false
	attack_ip = false
	
	
