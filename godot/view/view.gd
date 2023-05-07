class_name View
extends CanvasLayer

func _init() -> void:
	set_process_mode(Node.PROCESS_MODE_ALWAYS)

func _ready() -> void:
	var theme = load("res://theme/theme.tres")
	for child in get_children().filter(
		func(x: Node):
			return x is Control):
				child.theme = theme
