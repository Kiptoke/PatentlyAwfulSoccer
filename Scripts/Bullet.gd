extends KinematicBody2D

var speed = 1500
var velocity = Vector2()

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if(collision.collider.is_in_group("Walls")):
			queue_free()
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
