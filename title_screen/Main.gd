extends Node2D

var sig_cpt : = 0

func test_win() -> void:
	sig_cpt += 1
	print("sig_cpt %d" % sig_cpt)
	if sig_cpt >= 4:
		$TileMap/platforms/button_won/AnimatedSprite.play("on")
		get_tree().quit()

func test_loss() -> void:
	sig_cpt -= 1
	print("sig_cpt %d" % sig_cpt)
