extends Node


func get_signal(event: GDScript) -> Signal:
	var event_name = event.to_string()
	if not has_user_signal(event_name):
		add_user_signal(event_name, [{"name": event_name, "type": Event}])
	return Signal(self, event_name)


func register_signal(event: Signal) -> Signal:
	var event_name = event.get_name()
	if not has_user_signal(event_name):
		add_user_signal(event_name, [{"name": event_name}])
	return Signal(event)


func emit(event: Event) -> void:
	if event.has_method("_init"):
		get_signal(event.get_script()).emit(event)
	else:
		get_signal(event.get_script()).emit()


func disconnect_all(object: Object) -> void:
	if object:
		for conn in object.get_incoming_connections():
			if has_user_signal(conn.get("signal").get_name()):
				conn.get("signal").disconnect(conn.get("callable"))
