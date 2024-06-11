extends CharacterBody2D

# Define the speed of the paddle
var speed = 300
# Reference to the ball

var ball = null
# Reaction time delay
var reaction_time = 0.01
var time_since_last_move = 0
# Define the middle position of the paddle
var middle_position = position
# Define the x position that represents the midfield
var midfield_x = 576  # Adjust based on your screen size

func _ready():
	# Find the ball in the scene
	ball = get_parent().get_node("Ball")

func _process(delta):
	if ball == null:
		ball = get_parent().get_node("Ball")
	
	if ball:
		time_since_last_move += delta

		if time_since_last_move >= reaction_time:
			time_since_last_move = 0
		
			var movement = Vector2()
			if ball.position.x > midfield_x:
				# Get the direction to move towards the ball's y position
				var direction = (ball.position.y - position.y)
				direction = direction / abs(direction) if direction != 0 else 0
				movement.y = direction * speed * delta
			else:
				# Return to the middle position
				var middle_direction = (middle_position.y - position.y)
				middle_direction = middle_direction / abs(middle_direction) if middle_direction != 0 else 0
				movement.y = middle_direction * speed * delta
			
			# Move the paddle and handle collision
			move_and_collide(movement)
	position.x = 1125
