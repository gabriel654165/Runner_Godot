extends Area2D

signal stop

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "vilain":
			emit_signal("stop")
