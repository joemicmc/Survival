class_name InputState
extends State

func enter() -> void:
	super.enter()
	
	if not GameService.is_focused:
		return
	
	for action in InputActions.BUTTONS:
		if Input.is_action_pressed(action):
			emit(InputJustPressed.new(action))
		else:
			emit(InputJustReleased.new(action))

func process(delta: float) -> void:
	super.process(delta)
	
	if not GameService.is_focused:
		return
	
	for action in InputActions.BUTTONS:
		if Input.is_action_just_pressed(action):
			emit(InputJustPressed.new(action))
		if Input.is_action_pressed(action):
			emit(InputPressed.new(action))
		if Input.is_action_just_released(action):
			emit(InputJustReleased.new(action))

	for action in InputActions.VECTORS:
		var strength = Input.get_vector(
			"%s_left" % action,
			"%s_right" % action,
			"%s_up" % action,
			"%s_down" % action)
		emit(InputVectorChanged.new(action, strength))
	
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
