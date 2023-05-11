extends Node

var is_focused := true


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_FOCUS_OUT:
			is_focused = false
		NOTIFICATION_APPLICATION_FOCUS_IN:
			is_focused = true


func quit() -> void:
	get_tree().quit()
