extends Control

func _on_ExitButton_pressed():
	get_tree().quit()
func _on_LVL1_pressed():
	get_tree().change_scene("res://World1.tscn")
func _on_LVL2_pressed():
	get_tree().change_scene("res://World2.tscn")
func _on_LVL3_pressed():
	get_tree().change_scene("res://World3.tscn")
func _on_LVL4_pressed():
	get_tree().change_scene("res://World4.tscn")
