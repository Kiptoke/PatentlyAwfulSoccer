extends Area2D

func _on_BlueGoal_body_entered(body):
	if body.name == "Ball":
		$Goal.play()
