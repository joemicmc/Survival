class_name ControllerState
extends State

func enter() -> void:
	super.enter()
	
	get_signal(InputJustPressed).connect(
		func(x: InputJustPressed):
			match x.action:
				InputActions.START:
					emit(ControllerStartJustPressed.new())
				InputActions.BACK:
					emit(ControllerBackJustPressed.new())
			pass)
