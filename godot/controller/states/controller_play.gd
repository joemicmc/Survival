class_name ControllerPlay
extends ControllerState

func enter() -> void:
	super.enter()
	
	get_signal(InputVectorChanged).connect(
		func(x: InputVectorChanged):
			match x.action:
				InputActions.LEFT_STICK:
					emit(ControllerMoveChanged.new(x.strength))
			pass)
