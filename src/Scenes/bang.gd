extends Sprite


var timer = 0

func _ready():
	timer = 0


func _process(dt):
	timer += dt
	if timer > 0.5:
		get_tree().change_scene("res://Scenes/done.tscn")
