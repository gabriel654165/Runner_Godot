extends ColorRect

signal fade_end

func fade_in():
	$AnimationPlayer.play("fade")


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_end")
