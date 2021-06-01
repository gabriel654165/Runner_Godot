extends KinematicBody2D

onready var animated_sprite : AnimatedSprite = $AnimatedSprite

export var move_speed : = 250.0
export var push_speed : = 125.0

func _physics_process(delta: float) -> void:
	var motion : = Vector2()
	var save_motion : = Vector2()
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	update_animaion(motion)
	move_and_slide(motion.normalized() * move_speed, Vector2())
	if get_slide_count() > 0:
		check_box_collision(motion)
	save_motion = motion

func update_animaion(motion: Vector2) -> void:
	var animation : = "default"
	if motion.x > 0:
		animation = "right"
	if motion.x < 0:
		animation = "left"
	if motion.y > 0:
		animation = "down"
	if motion.y < 0:
		animation = "up"
	if animated_sprite.animation != animation:
		animated_sprite.play(animation)

func check_box_collision(motion: Vector2) -> void:
	if abs(motion.x) + abs(motion.y) > 1:
		return
	var box : = get_slide_collision(0).collider as box
	if box:
		box.push(push_speed * motion)

