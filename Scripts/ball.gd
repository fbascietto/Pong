extends RigidBody2D

# Variables for ball speed and direction
var initial_speed = 250
var direction = Vector2()
var colliding = false

func _ready():
	reset_ball()

func reset_ball():
	# middle of the screen
	var spawn_position = Vector2(576, 324) # get_parent().get_viewport_rect().size / 2
	position = spawn_position

	# Randomize the initial direction
	var angle = randf_range(-PI / 4, PI / 4)
	direction = Vector2(cos(angle), sin(angle)).normalized()
	if randf() > 0.5:
		direction.x = -direction.x

func _physics_process(delta):
	# Keep applying the velocity to ensure constant movement
	linear_velocity = direction * initial_speed

	var collision_info = move_and_collide(linear_velocity * delta)
	if collision_info and not colliding:
		direction = direction.bounce(collision_info.get_normal()) 
		colliding = true
		AudioManager.play_sound(AudioManager.HIT)
		var c = collision_info.get_collider().name
		if(c != "Wall" or c != "Wall2"):
			get_tree().call_group("MainGame", "reset_ball_bounce")
		else:
			get_tree().call_group("MainGame", "add_wall_bounce")
	else:
		colliding = false
