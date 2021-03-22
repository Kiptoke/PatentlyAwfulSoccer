extends Area2D

func _on_RedGoal_body_entered(body):
	if body.name == "Ball":
		$Goal.play()
