extends Area2D

signal kill_hero

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "hero":
			get_tree().change_scene("res://title_screen/TitleScreen.tscn")
