@tool
class_name CustomTileMap
extends TileMap

func _use_tile_data_runtime_update (_layer: int, _coords: Vector2i) -> bool:
	return true

func _tile_data_runtime_update (_layer: int, _coords: Vector2i, _tile_data: TileData) -> void:
	pass
