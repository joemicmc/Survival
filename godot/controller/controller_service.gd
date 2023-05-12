extends StateMachine


func _init() -> void:
	super._init()
	set_process_mode(Node.PROCESS_MODE_ALWAYS)


func _ready() -> void:
	super._ready()
	EventService.get_signal(ViewChanged).connect(on_view_changed)
	
	change_state(ControllerMenu.new(self))

func on_view_changed(view_changed: ViewChanged) -> void:
	if view_changed.view is Game:
		change_state(ControllerPlay.new(self))
	else:
		change_state(ControllerMenu.new(self))
