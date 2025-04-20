extends CharacterBody2D
const SPEED = 80
const GRAVITY = 5
const JUMP_POWER = -50
const FLOOR = Vector2(0,-1)
var acceleration = 0.1
var is_dead = false

func _physics_process(delta):
	if is_dead == false:
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
			$sprite.flip_h = false
			$sprite.play("idle")
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
			$sprite.flip_h = true
			$sprite.play("idle")
		else:
			velocity.x=0
			$sprite.play("idle")
			
		if Input.is_action_pressed("ui_up"):
			velocity.y = JUMP_POWER * acceleration
			acceleration = acceleration + 0.1
			$sprite.play("up")
			$sounds/burnSound.play()
		else:
			acceleration = 0.1
			
		velocity.y += GRAVITY
		set_velocity(velocity)
		set_up_direction(FLOOR)
		move_and_slide()
		checkcollision()
		
func dead():
	$CollisionShape2D.disabled = true
	$Timer.start()
	is_dead = true
	velocity = Vector2(0,0)
	$sprite.play("explosion")
	acceleration = 0
	$sounds/explosionSound.play()



func checkcollision() -> void:
	for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider() is TileMapLayer:
				if collision.get_collider().get("name")=="deadzone":
					dead()

func _on_timer_timeout() -> void:
	Global.life = Global.life - 1
	if (Global.life == -1):
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
	else:
		get_tree().reload_current_scene()
