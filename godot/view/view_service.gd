extends EventNode

var stack: Array[View] = []


func _ready() -> void:
	super._ready()
	push_root(MainView.instance())


func push_root(view: View) -> void:
	stack.clear()
	for child in get_children():
		child.queue_free()
	push_view(view)


func push_view(view: View) -> void:
	if stack.size():
		stack.front().exit()
	add_child(view)
	stack.push_front(view)
	stack.front().enter()
	
	EventService.emit(ViewChanged.new(stack.front()))


func pop_view() -> void:
	if not stack.size():
		return
	stack.front().exit()
	stack.front().queue_free()
	stack.pop_front()
	if not stack.size():
		return
	stack.front().enter()
	
	EventService.emit(ViewChanged.new(stack.front()))
