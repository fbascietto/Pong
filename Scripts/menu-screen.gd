extends Control

const AI_SCRIPT = "AI"
const HUMAN_SCRIPT = "HUMAN"
const MAIN_LEVEL = "res://Scenes/game-court.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()

func _on_button_pressed():
	Global.player_2 = AI_SCRIPT
	get_tree().change_scene_to_file(MAIN_LEVEL)

func _on_two_players_button_pressed():
	Global.player_2 = HUMAN_SCRIPT
	get_tree().change_scene_to_file(MAIN_LEVEL)
