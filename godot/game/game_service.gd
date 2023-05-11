extends EventNode

func _notification(what: int) -> void:
	super._notification(what)
	
	match what:
		NOTIFICATION_APPLICATION_FOCUS_OUT:
			emit(GameFocusChanged.new(false))
		NOTIFICATION_APPLICATION_FOCUS_IN:
			emit(GameFocusChanged.new(true))


func quit() -> void:
	get_tree().quit()
