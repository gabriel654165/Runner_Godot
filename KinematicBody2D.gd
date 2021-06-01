extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const SPEED_MAX = 550
const AC_MAX = 550
const JUMP_HEIGHT = -550
var motion = Vector2()
var speed_ac = 0
var reset_ac = 0
var slide = 0

# warning-ignore:unused_argument
func _physics_process(delta):
	$run_shape.disabled = false
	$slide_shape.disabled = true
	if slide > 1:
		$AnimatedSprite.play("slide")
		$run_shape.disabled = true
		$slide_shape.disabled = false
		slide -= 1
	else:
		$AnimatedSprite.play("run")

	motion.y += GRAVITY
	if speed_ac <= AC_MAX:
		speed_ac += 7
	if reset_ac == 1:
		speed_ac = 0
		reset_ac = 0
	motion.x = SPEED + speed_ac;
#	print("MOTION.X = ", motion.x)
	
	if is_on_floor():
		if Input.is_action_pressed("ui_down"):
			slide = 50
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	
	motion = move_and_slide(motion, UP)
	pass



func _on_Area2D_reset_run():
	$AnimatedSprite.play("stop")
	reset_ac = 1
	pass
func _on_kill_hero_kill_hero():
	print("he died")
	pass # Replace with function body.
