class_name MenuView
extends View


func enter() -> void:
	super.enter()
	EventService.get_signal(ControllerCancelPressed).connect(on_controller_cancel_pressed)


func on_controller_cancel_pressed() -> void:
	ViewService.pop_view()
