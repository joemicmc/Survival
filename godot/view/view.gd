class_name View
extends CanvasLayer

const THEME: Theme = preload("res://theme/theme.tres")


func _init() -> void:
	set_process_mode(Node.PROCESS_MODE_ALWAYS)


func _ready() -> void:
	for child in get_children().filter(
		func(x: Node):
			return x is Control):
				child.theme = THEME
