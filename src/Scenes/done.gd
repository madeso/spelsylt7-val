extends Sprite



func _input(event):
	if event.is_action_pressed("click"):
		get_tree().change_scene("res://Scenes/game.tscn")
