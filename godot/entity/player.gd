class_name Player
extends Node

static func instance() -> Player:
	return preload("res://entity/player.tscn").instantiate()

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	print(get_multiplayer_authority())
