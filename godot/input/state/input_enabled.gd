class_name InputEnabled
extends InputState


func process(delta: float) -> void:
	super.process(delta)
	
	for action in InputActions.BUTTONS:
		if Input.is_action_just_pressed(action):
			EventService.emit(InputPressed.new(action))
		if Input.is_action_pressed(action):
			var strength = Input.get_action_strength(action)
			EventService.emit(InputChanged.new(action, strength))
		if Input.is_action_just_released(action):
			EventService.emit(InputReleased.new(action))

	for action in InputActions.VECTORS:
		var strength = Input.get_vector(
			"%s_left" % action,
			"%s_right" % action,
			"%s_up" % action,
			"%s_down" % action)
		EventService.emit(InputVectorChanged.new(action, strength))
	
	for action in InputActions.UI:
		if Input.is_action_just_pressed(action):
			var input_event = InputEventAction.new()
			input_event.action = InputActions.UI[action]
			input_event.pressed = true
			Input.parse_input_event(input_event)
			input_event = InputEventAction.new()
			input_event.action = InputActions.UI[action]
			input_event.pressed = false
			Input.parse_input_event(input_event)
