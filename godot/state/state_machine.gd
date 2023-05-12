class_name StateMachine
extends EventNode

var current_state: State


func _ready() -> void:
	super._ready()


func _process(delta: float) -> void:
	super._process(delta)
	if (current_state):
		current_state.process(delta)


func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if (current_state):
		current_state.physics_process(delta)


func _notification(what: int) -> void:
	super._notification(what)
	if (what == NOTIFICATION_PREDELETE):
		EventService.disconnect_all(current_state)


func change_state(state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = state
	current_state.enter()
	
	EventService.emit(StateChanged.new(current_state))
