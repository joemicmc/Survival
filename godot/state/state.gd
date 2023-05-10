class_name State
extends RefCounted

var state_machine: StateMachine

func _init(_state_machine) -> void:
	state_machine = _state_machine

func enter() -> void:
	pass

func physics_process(_delta: float) -> void:
	pass

func process(_delta: float) -> void:
	pass

func get_signal(event: GDScript) -> Signal:
	return EventService.get_signal(event)

func emit(event: Event) -> void:
	EventService.emit(event)
	
func exit() -> void:
	EventService.disconnect_all(self)

func _notification(what: int) -> void:
	if (what == NOTIFICATION_PREDELETE):
		EventService.disconnect_all(self)
