extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const SPEED_MAX = 500
const AC_MAX = 500
const JUMP_HEIGHT = -550
var motion = Vector2()
var speed_ac = 0
var slide = 0
var jump = 0
var stop = 0

func _physics_process(delta):
	$shape_vilain_run.disabled = false
	$shape_vilain_slide.disabled = true
	if slide > 1:
		$shape_vilain_run.disabled = true
		$shape_vilain_slide.disabled = false
		$AnimatedSprite.play("slide")
		slide -= 1
	else:
		$AnimatedSprite.play("run")
		slide = 0
	motion.y += GRAVITY
	
	if stop == 0:
		if speed_ac <= AC_MAX:
			speed_ac += 7
		motion.x = SPEED + speed_ac;

		if is_on_floor():
			if jump == 1:
				motion.y = JUMP_HEIGHT
				jump = 0
		elif jump == 1:
			jump = 0
	else:
		motion.x = 0
		motion.y = -5
	
	motion = move_and_slide(motion, UP)
	pass


func _on_slide_slide():
	slide = 30
	pass
func _on_jump1_jump():
	jump = 1
	pass
func _on_stop_ia_stop():
	stop = 1
	pass
