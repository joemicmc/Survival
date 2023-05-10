class_name EventNode
extends Node

func _init() -> void:
	set_process_mode(Node.PROCESS_MODE_PAUSABLE)

func _enter_tree() -> void:
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass

func _notification(what: int) -> void:
	if (what == NOTIFICATION_PREDELETE):
		EventService.disconnect_all(self)

func get_signal(event: GDScript) -> Signal:
	return EventService.get_signal(event)

func emit(event: Event) -> void:
	EventService.emit(event)

