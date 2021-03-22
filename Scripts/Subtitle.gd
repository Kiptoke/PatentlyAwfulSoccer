extends RichTextLabel

func _ready():
	var tween = $Tween
	
	tween.interpolate_property($".", "position", 
			Vector2(rect_position.x, -100), Vector2(rect_position.x, rect_position.y), 3,
			Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
