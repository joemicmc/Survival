class_name Spawner
extends MultiplayerSpawner


func _ready() -> void:
	spawn_path = get_path()
	spawn_limit = 4
	add_spawnable_scene(Map.PACKED_SCENE.resource_path)
	add_spawnable_scene(Player.PACKED_SCENE.resource_path)


func add_map() -> void:
	add_child(Map.instance())


func add_player(id: int) -> void:
	add_child(Player.instance(id), true)


func remove_all() -> void:
	for child in get_children():
		child.queue_free()


func remove_player(id: int) -> void:
	if not has_node(str(id)):
		return
	get_node(str(id)).queue_free()
