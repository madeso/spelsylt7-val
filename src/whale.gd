extends KinematicBody2D

const DEAD_ZONE = 600
const DEAD_ZONE_TARGET = DEAD_ZONE + 20
const MAX_WAIT = 0.5

var speed = 600

onready var target = position
var velocity = Vector2()
var dashing = false
var wait_timer = 0
var playing = true

func _input(event):
	if event.is_action_pressed("click"):
		if dashing == false and playing:
			target = get_global_mouse_position()
			dashing = true
			wait_timer = 0
			print("daashing")

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	var dist = position.distance_to(target)
	if dist > 5:
		look_at(target)
		$sprite.flip_v = position.x > target.x
		velocity = move_and_slide(velocity)
	else:
		dashing = false
	
	if dashing == false:
		wait_timer += delta
	
	if wait_timer > MAX_WAIT and playing:
		playing = false
		print("failed")
		target.y = DEAD_ZONE_TARGET
	
	if position.y > DEAD_ZONE:
		if playing == false:
			print("died")
			playing = true
