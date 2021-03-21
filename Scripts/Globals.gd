extends Node

var blue_score = 0
var red_score = 0

func get_scores():
	var string = "[center]%d - %d[/center]"
	return string % [red_score, blue_score]

