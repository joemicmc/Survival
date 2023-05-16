class_name ControllerState
extends State


func enter() -> void:
	super.enter()
	EventService.get_signal(InputPressed).connect(on_input_pressed)


func on_input_pressed(input_pressed: InputPressed) -> void:
	match input_pressed.action:
		InputActions.START:
			EventService.emit(ControllerStartPressed.new())
		InputActions.BACK:
			EventService.emit(ControllerBackPressed.new())
