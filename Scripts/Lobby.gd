extends Node

export var ip = "127.0.0.1"
export (int) var port = 6969
export (int) var max_players = 2

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")

func _on_HostBtn_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_server(port, max_players)
	get_tree().set_network_peer(net)
	
	print("Server running!")

func _on_JoinBtn_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_client(ip, port)
	get_tree().set_network_peer(net)

func _player_connected(id):
	Globals.player2id = id
	var game = preload("res://Scenes/Field.tscn").instance()
	get_tree().get_root().add_child(game)
	$HostBtn.hide()
	$JoinBtn.hide()
