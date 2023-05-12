extends EventNode

const PORT := 4433
const ADDRESS := "192.168.1.200"

var spawner := Spawner.new()


func _ready() -> void:
	super._ready()
	add_child(spawner, true)
	multiplayer.multiplayer_peer = OfflineMultiplayerPeer.new()
	register_signal(multiplayer.connected_to_server).connect(on_connected_to_server)
	register_signal(multiplayer.connection_failed).connect(on_connection_failed)
	register_signal(multiplayer.server_disconnected).connect(on_server_disconnected)


func create_server() -> void:
	var peer = ENetMultiplayerPeer.new()
	
	if not peer.create_server(PORT) == OK:
		ViewService.push_view(Modal.instance("Failed to create server."))
		return
	
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(spawner.add_player)
	multiplayer.peer_disconnected.connect(spawner.remove_player)
	
	spawner.add_map()
	spawner.add_player(1)
	ViewService.push_root(Game.instance())


func create_client() -> void:
	var peer = ENetMultiplayerPeer.new()
	
	if not peer.create_client(ADDRESS, PORT) == OK:
		ViewService.push_view(Modal.instance("Failed to create client."))
		return
	
	multiplayer.multiplayer_peer = peer


func close_connection() -> void:
	if (multiplayer.is_server()):
		spawner.remove_all()
		multiplayer.peer_connected.disconnect(spawner.add_player)
		multiplayer.peer_disconnected.disconnect(spawner.remove_player)
		
	multiplayer.multiplayer_peer = OfflineMultiplayerPeer.new()
	ViewService.push_root(Menu.instance())


func on_connected_to_server() -> void:
	ViewService.push_root(Game.instance())


func on_connection_failed() -> void:
	ViewService.push_view(Modal.instance("Failed to connect."))


func on_server_disconnected() -> void:
	multiplayer.multiplayer_peer = OfflineMultiplayerPeer.new()
	ViewService.push_root(Menu.instance())
	ViewService.push_view(Modal.instance("Disconnected from server."))
