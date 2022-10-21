extends Node2D

const SPACE_OFFSET = 333
var in_space = false
var timer = 0

const SPAWN = 0.50
const RANDOM_RANGE = 300
const BORDER = 25

var rng = RandomNumberGenerator.new()
var heli = preload("res://Prefabs/Heli.tscn")

func _init():
	rng.randomize()
	VisualServer.set_default_clear_color(Color(0.322, 0.7333, 0.910, 1))

func _process(dt):
	if $whale.position.y < $Transition.position.y + SPACE_OFFSET and in_space == false:
		VisualServer.set_default_clear_color(Color(0, 0, 0, 1))
		in_space = true
	
	if $whale.dashing:
		timer += dt
		while timer > SPAWN:
			timer -= SPAWN
			var cam = $"whale/Camera2D"
			var inst = heli.instance()
			inst.position.x = rng.randf_range(BORDER, 375 - BORDER)
			inst.position.y = cam.global_position.y - 667 + rng.randf_range(-RANDOM_RANGE, 0)
			add_child(inst)
