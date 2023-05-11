class_name ServerSync
extends MultiplayerNode


func _enter_tree() -> void:
	set_multiplayer_authority(1)
