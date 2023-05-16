class_name PauseView
extends MenuView


func enter() -> void:
	super.enter()
	EventService.get_signal(ControllerStartPressed).connect(on_controller_start_pressed)


func on_controller_start_pressed() -> void:
	ViewService.pop_view()
