@tool
class_name CustomTileMap
extends TileMap

func _use_tile_data_runtime_update (layer: int, coords: Vector2i) -> bool:
	return true

func _tile_data_runtime_update (layer: int, coords: Vector2i, tile_data: TileData) -> void:
	pass
