class_name Spawner
extends MultiplayerSpawner

const PACKED_SCENE: PackedScene = preload("res://multiplayer/spawner.tscn")

var spawn_node: Node2D


static func instance() -> Spawner:
	return PACKED_SCENE.instantiate()


func _ready() -> void:
	spawn_node = get_node(spawn_path)
	add_spawnable_scene(Map.PACKED_SCENE.resource_path)
	add_spawnable_scene(Player.PACKED_SCENE.resource_path)


func add_map() -> void:
	spawn_node.add_child(Map.instance())


func add_player(id: int) -> void:
	spawn_node.add_child(Player.instance(id), true)


func remove_all() -> void:
	for child in spawn_node.get_children():
		child.queue_free()


func remove_player(id: int) -> void:
	if not spawn_node.has_node(str(id)):
		return
	spawn_node.get_node(str(id)).queue_free()
