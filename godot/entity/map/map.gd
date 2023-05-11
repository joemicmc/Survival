class_name Map
extends MultiplayerNode

const PACKED_SCENE: PackedScene = preload("res://entity/map/map.tscn")


static func instance() -> Map:
	return PACKED_SCENE.instantiate()
