extends Node2D

onready var player1pos = $Player1Pos
onready var player2pos = $Player2Pos

func _ready():
	var player1 = preload("res://Scenes/Player.tscn").instance()
	player1.transform = player1pos.transform
	add_child(player1)
	
	#var player2 = preload("res://Scenes/Player.tscn").instance()
	#player2.transform = player2pos.transform
	#add_child(player2)

func restart_game():
	Globals.red_score = 0
	Globals.blue_score = 0
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_ReplayBtn_pressed():
	restart_game()

func _on_MenuBtn_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
