class_name ControllerPlay
extends ControllerState


func enter() -> void:
	super.enter()
	EventService.get_signal(InputVectorChanged).connect(on_input_vector_changed)


func on_input_vector_changed(input_vector_changed: InputVectorChanged) -> void:
	match input_vector_changed.action:
		InputActions.LEFT_STICK:
			EventService.emit(ControllerMoveChanged.new(input_vector_changed.strength))
