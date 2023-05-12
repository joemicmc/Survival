extends Node

var stack: Array[View] = []


func _ready() -> void:
	push_root(Menu.instance())


func push_root(view: View) -> void:
	stack.clear()
	for child in get_children():
		child.queue_free()
	add_child(view)
	stack.push_front(view)
	stack.front().enter()


func push_modal(view: View) -> void:
	stack.front().exit()
	add_child(view)
	stack.push_front(view)
	stack.front().enter()


func pop_modal() -> void:
	stack.front().exit()
	stack.front().queue_free()
	stack.pop_front()
	stack.front().enter()
