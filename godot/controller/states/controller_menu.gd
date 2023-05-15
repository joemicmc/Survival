class_name ControllerMenu
extends ControllerState


func on_input_pressed(input_pressed: InputPressed) -> void:
	super.on_input_pressed(input_pressed)
	match input_pressed.action:
		InputActions.RIGHT_ACTION:
			EventService.emit(CancelPressed.new())
