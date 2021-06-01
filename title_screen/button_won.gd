extends Area2D

onready var animated_sprite : AnimatedSprite = $AnimatedSprite

func _ready() -> void:
	animated_sprite.play("off")
