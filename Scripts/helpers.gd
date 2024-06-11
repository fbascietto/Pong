extends Node

func load_spawn_position() -> Vector2:
	var config = ConfigFile.new()
	var error = config.load("res://config.cfg")
	
	if error != OK:
		print("Error loading config file")
		return Vector2()
	
	var spawn_x = config.get_value("ball", "spawn_x", 400)
	var spawn_y = config.get_value("ball", "spawn_y", 300)
	
	return Vector2(spawn_x, spawn_y)
