class_name MultiplayerNode
extends Node

func set_auth(id: int) -> void:
	set_multiplayer_authority(id)

func is_auth() -> bool:
	if multiplayer.multiplayer_peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		return false;
	if is_multiplayer_authority():
		return true
	else:
		return false
