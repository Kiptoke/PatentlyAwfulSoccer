extends RichTextLabel

func _ready():
	bbcode_text = Globals.get_scores()

func _on_RedGoal_body_entered(_body):
	bbcode_text = Globals.get_scores()

func _on_BlueGoal_body_entered(_body):
	bbcode_text = Globals.get_scores()

func _on_ScoreText_visibility_changed():
	bbcode_text = Globals.get_scores()
