class_name ControllerState
extends State


func enter() -> void:
	super.enter()
	get_signal(InputJustPressed).connect(on_input_just_pressed)


func on_input_just_pressed(input_just_pressed: InputJustPressed) -> void:
	match input_just_pressed.action:
		InputActions.START:
			emit(ControllerStartJustPressed.new())
		InputActions.BACK:
			emit(ControllerBackJustPressed.new())
