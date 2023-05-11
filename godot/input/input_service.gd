extends StateMachine


func _init() -> void:
	super._init()
	set_process_mode(Node.PROCESS_MODE_ALWAYS)


func _ready() -> void:
	super._ready()
	
	get_signal(GameFocusChanged).connect(
		func(x: GameFocusChanged):
			if x.is_focused:
				change_state(InputDefault.new(self))
			else:
				change_state(InputSleep.new(self)))
	
	get_signal(StateChanged).connect(
		func(x: StateChanged):
			if x.state is ControllerState:
				current_state.enter())
	
	change_state(InputSleep.new(self))
