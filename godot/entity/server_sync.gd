class_name ServerSync
extends MultiplayerSynchronizer

func _enter_tree() -> void:
	set_multiplayer_authority(1)
