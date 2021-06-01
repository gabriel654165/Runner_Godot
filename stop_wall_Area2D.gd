extends Area2D

signal reset_run

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "hero":
			emit_signal("reset_run")
