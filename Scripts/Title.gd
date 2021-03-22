extends Sprite

func _ready():
	var tween = $Tween
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	tween.interpolate_property($".", "position", 
			Vector2(position.x, -100), Vector2(position.x, position.y), rand_range(0.5,2),
			Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
