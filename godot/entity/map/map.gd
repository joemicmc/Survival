class_name Map
extends MultiplayerNode

const PATH = "res://entity/map/map.tscn"

static func instance() -> Map:
	return preload(PATH).instantiate()
