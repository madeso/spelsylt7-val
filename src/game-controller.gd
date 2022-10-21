extends Node2D

const SPACE_OFFSET = 333
var in_space = false

func _init():
	VisualServer.set_default_clear_color(Color(0.322, 0.7333, 0.910, 1))

func _process(dt):
	if $whale.position.y < $Transition.position.y + SPACE_OFFSET and in_space == false:
		VisualServer.set_default_clear_color(Color(0, 0, 0, 1))
		in_space = true
