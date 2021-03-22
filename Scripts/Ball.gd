extends RigidBody2D

export (int) var wait = 2
export (int) var win_score = 10

func _on_VisibilityNotifier2D_screen_exited():
	# Create a new timer and wait 2 seconds
	var t = Timer.new()
	t.set_wait_time(wait)
	t.set_one_shot(true)
	t.autostart = true
	self.call_deferred("add_child", t)
	yield(t, "timeout")
	
	# Reset the position of the ball
	position = get_node("../BallSpawn").position
	rotation = 0
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	
	# Get rid of the timer
	t.queue_free()

func _on_RedGoal_body_entered(body):
	if(body.name == "Ball"):
		Globals.blue_score += 1
		end_game()

func _on_BlueGoal_body_entered(body):
	if(body.name == "Ball"):
		Globals.red_score += 1
		end_game()

func end_game():
	if Globals.blue_score >= win_score or Globals.red_score >= win_score:
		get_node("../GameEndPanel").visible = true
		get_tree().paused = true


func _on_Ball_body_entered(body):
	var name = body.name
	$AudioStreamPlayer2D.play()
	if name == "Bullet":
		body.queue_free()
