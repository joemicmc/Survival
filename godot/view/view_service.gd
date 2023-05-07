extends Node

var stack: Array[View] = []

func change_root(path: String) -> void:
	stack.clear()
	get_tree().change_scene_to_file(path)
