class_name State
extends RefCounted

var state_machine: StateMachine


func _init(_state_machine: StateMachine) -> void:
	state_machine = _state_machine


func _notification(what: int) -> void:
	if (what == NOTIFICATION_PREDELETE):
		EventService.disconnect_all(self)


func enter() -> void:
	pass


func physics_process(_delta: float) -> void:
	pass


func process(_delta: float) -> void:
	pass


func exit() -> void:
	EventService.disconnect_all(self)
