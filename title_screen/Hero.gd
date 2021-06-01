extends KinematicBody2D

#Movement control
var motion = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = 400
	elif Input.is_action_pressed("ui_left"):
		motion.x = -400
	else:
		motion.x = 0
	if Input.is_action_pressed("ui_down"):
		motion.y = 400
	elif Input.is_action_pressed("ui_up"):
		motion.y = -400
	else:
		motion.y = 0
	move_and_slide(motion)
