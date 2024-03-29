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


func _notification(what: int) -> void:
	if (what == NOTIFICATION_PREDELETE):
		EventService.disconnect_all(self)


func enter() -> void:
	pass


func exit() -> void:
	EventService.disconnect_all(self)
