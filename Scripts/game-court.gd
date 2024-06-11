extends Node2D

# Reference to the ball scene
var ball_scene = preload("res://Scenes/ball.tscn")
var ball_instance = null

var left_score = 0
var right_score = 0

@export var wall_bounces = 0

func load_p2():
	var opponent_type = Global.player_2
	$Player2.set_script(load("res://Scripts/ai_pallet.gd" if opponent_type == "AI" else "res://Scripts/player2.gd"))
	$Player2._ready()
	$Player2.set_process(true) # if you have processing logic
	$Player2.set_physics_process(true) # if you have physics logic

func _ready():
	load_p2()
	spawn_ball()

func _process(delta):
	check_wall_bounces()

func spawn_ball():
	# Instance the ball and add it to the scene
	ball_instance = ball_scene.instantiate()
	add_child(ball_instance)

func _on_goal_area_left_area_entered(_area):
	right_score += 1
	$RightScore.text = str(right_score)
	AudioManager.play_sound(AudioManager.GOAL)
	ball_instance.reset_ball()

func _on_goal_area_right_area_entered(_area):
	left_score += 1
	$LeftScore.text = str(left_score)
	AudioManager.play_sound(AudioManager.GOAL)
	ball_instance.reset_ball()

func check_wall_bounces():
	if(wall_bounces > 4):
		ball_instance.reset_ball()

func add_wall_bounce():
	wall_bounces += 1

func reset_wall_bounce():
	wall_bounces = 0

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu-screen.tscn")
