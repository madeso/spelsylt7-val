extends Area2D


func _on_Heli_body_entered(body):
	body.collected()
	queue_free()
