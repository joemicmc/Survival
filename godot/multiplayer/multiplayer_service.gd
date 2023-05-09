extends Node

const PORT := 4433
const ADDRESS := "192.168.1.200"

var spawner := Spawner.new()

func _ready() -> void:
	add_child(spawner, true)
	
	multiplayer.peer_connected.connect(
		func(id: int):
			if (multiplayer.is_server()):
				spawner.add_player(id))
	
	multiplayer.peer_disconnected.connect(
		func(id: int):
			if (multiplayer.is_server()):
				spawner.remove_player(id))
	
	multiplayer.server_disconnected.connect(
		func():
			ViewService.change_root(Menu.PATH))

func try_create_peer(is_server: bool = false) -> bool:
	var peer = ENetMultiplayerPeer.new()
	if is_server:
		peer.create_server(PORT)
	else:
		peer.create_client(ADDRESS, PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		return false
	multiplayer.multiplayer_peer = peer
	if is_server:
		spawner.add_map()
		spawner.add_player(1)
	return true
