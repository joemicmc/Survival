class_name Main
extends MultiplayerSpawner

const PORT := 4433
const ADDRESS := "192.168.1.200"

@onready var host: Button = %Host
@onready var connect: Button = %Connect

func _ready() -> void:
	host.pressed.connect(
		func():
			set_peer(true))
	
	connect.pressed.connect(
		func():
			set_peer(false))
	
	multiplayer.peer_connected.connect(
		func(id: int):
			if (multiplayer.is_server()):
				add_player(id))
	
	multiplayer.peer_disconnected.connect(
		func(id: int):
			if (multiplayer.is_server()):
				remove_player(id))
	

func set_peer(is_server: bool) -> void:
	var peer = ENetMultiplayerPeer.new()
	if is_server:
		peer.create_server(PORT)
	else:
		peer.create_client(ADDRESS, PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		return
	multiplayer.multiplayer_peer = peer
	if is_server:
		add_player(1)

func add_player(id: int) -> void:
	var player = Player.instance()
	player.name = str(id)
	add_child(player, true)

func remove_player(id: int) -> void:
	if not has_node(str(id)):
		return
	get_node(str(id)).queue_free()
