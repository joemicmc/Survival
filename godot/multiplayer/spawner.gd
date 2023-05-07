class_name Spawner
extends MultiplayerSpawner

func _ready() -> void:
	spawn_path = get_path()
	spawn_limit = 4
	add_spawnable_scene(Player.PATH)

func add_player(id: int) -> void:
	add_child(Player.instance(id), true)

func remove_player(id: int) -> void:
	if not has_node(str(id)):
		return
	get_node(str(id)).queue_free()
