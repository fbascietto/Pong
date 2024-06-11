extends CharacterBody2D

var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var move_up = Input.is_action_pressed("P1-Up")
	var move_down = Input.is_action_pressed("P1-Down")
	 # Calculate the movement based on input
	var movement = Vector2()
	if move_up:
		movement.y -= speed * delta
	if move_down:
		movement.y += speed * delta
	# Update the paddle's position
	move_and_collide(movement)
	
	position.x = 30
