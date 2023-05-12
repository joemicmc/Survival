extends StateMachine


func _init() -> void:
	super._init()
	set_process_mode(Node.PROCESS_MODE_ALWAYS)


func _ready() -> void:
	super._ready()
	EventService.get_signal(GameFocusChanged).connect(on_game_focus_changed)
	EventService.get_signal(StateChanged).connect(on_state_changed)
	
	change_state(InputDefault.new(self))


func on_game_focus_changed(game_focus_changed: GameFocusChanged) -> void:
	if game_focus_changed.is_focused:
		change_state(InputDefault.new(self))
	else:
		change_state(InputSleep.new(self))


func on_state_changed(state_changed: StateChanged) -> void:
	if state_changed.state is ControllerState:
		current_state.enter()
