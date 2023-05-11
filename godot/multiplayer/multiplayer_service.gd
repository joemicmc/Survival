extends Node

const PORT := 4433
const ADDRESS := "192.168.1.200"

var spawner := Spawner.new()


func _ready() -> void:
	multiplayer.multiplayer_peer = OfflineMultiplayerPeer.new()
	
	add_child(spawner, true)
	
	multiplayer.peer_connected.connect(
		func(id: int):
			if (multiplayer.is_server()):
				spawner.add_player(id))
	
	multiplayer.peer_disconnected.connect(
		func(id: int):
			if (multiplayer.is_server()):
				spawner.remove_player(id))
	
	multiplayer.connected_to_server.connect(
		func():
			ViewService.change_view_to(Game.PACKED_SCENE))
	
	multiplayer.server_disconnected.connect(
		func():
			multiplayer.multiplayer_peer = OfflineMultiplayerPeer.new()
			ViewService.change_view_to(Menu.PACKED_SCENE))


func create_server() -> void:
	var peer = ENetMultiplayerPeer.new()
	
	peer.create_server(PORT)
	
	if peer.get_connection_status() != MultiplayerPeer.CONNECTION_CONNECTED:
		return
	
	multiplayer.multiplayer_peer = peer
	
	spawner.add_map()
	spawner.add_player(1)
	
	ViewService.change_view_to(Game.PACKED_SCENE)


func create_client() -> void:
	var peer = ENetMultiplayerPeer.new()
	
	peer.create_client(ADDRESS, PORT)
	
	multiplayer.multiplayer_peer = peer
