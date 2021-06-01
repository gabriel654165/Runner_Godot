extends Area2D

onready var animated_sprite : AnimatedSprite = $AnimatedSprite

signal pressed
signal unpressed
signal sig1_p
signal sig2_p
signal sig3_p
signal sig4_p
signal sig1_m
signal sig2_m
signal sig3_m
signal sig4_m

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")
	
func _on_body_entered(body: PhysicsBody2D) -> void:
	if not body is box:
		return
	animated_sprite.play("pressed")
	emit_signal("pressed")

func _on_body_exited(body: PhysicsBody2D) -> void:
	if not body is box:
		return
	animated_sprite.play("default")
	emit_signal("unpressed")

#push_sigs
func _on_RedPlatform3_body_entered(body):
	emit_signal("sig3_p")
func _on_RedPlatform2_body_entered(body):
	emit_signal("sig2_p")
func _on_RedPlatform_body_entered(body):
	emit_signal("sig1_p")
func _on_RedPlatform4_body_entered(body):
	emit_signal("sig4_p")

func _on_RedPlatform_body_exited(body):
	emit_signal("sig1_m")
func _on_RedPlatform2_body_exited(body):
	emit_signal("sig2_m")
func _on_RedPlatform3_body_exited(body):
	emit_signal("sig3_m")
func _on_RedPlatform4_body_exited(body):
	emit_signal("sig4_m")
