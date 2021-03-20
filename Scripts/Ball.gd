extends RigidBody2D


func _on_LeftGoal_body_entered(body):
	if(body.name == "Ball"):
		print("left goal")

func _on_RightGoal_body_entered(body):
	if(body.name == "Ball"):
		print("right goal")
