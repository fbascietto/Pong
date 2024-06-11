extends Node

#Music

#Sounds
const HIT : AudioStreamMP3 = preload("res://Sounds/hit.mp3")
const GOAL: AudioStreamOggVorbis = preload("res://Sounds/goal.ogg")

#Refrences
@onready var sound_players = $Sounds.get_children()

func play_sound(sound):
	for player in sound_players:
		if not player.playing:
			player.stream = sound
			player.play()
			break
