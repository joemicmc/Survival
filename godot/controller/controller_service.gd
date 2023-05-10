extends StateMachine

func _init() -> void:
	super._init()
	
	set_process_mode(Node.PROCESS_MODE_ALWAYS)

func _ready() -> void:
	super._ready()
	
	change_state(ControllerPlay.new(self))
