extends RichTextLabel

func _on_EndLabel_visibility_changed():
	var string = "[center]%s wins![/center]"
	var red = "[color=red]RED[/color]"
	var blue = "[color=blue]BLUE[/color]"
	if Globals.red_score > Globals.blue_score:
		bbcode_text = string % red
	else:
		bbcode_text = string % blue
