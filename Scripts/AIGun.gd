extends Sprite

onready var ball = get_node("../../Ball")

func _process(_delta):
	look_at(ball.position)
