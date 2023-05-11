extends Node


func change_view_to(packed_scene: PackedScene) -> void:
	get_tree().change_scene_to_packed(packed_scene)
