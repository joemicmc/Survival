class_name Modal
extends View

const PACKED_SCENE: PackedScene = preload("res://view/modal/modal.tscn")

var on_ready: Callable

@onready var message: Label = %Message
@onready var ok: Button = %OK


static func instance(text: String) -> Modal:
	var modal = PACKED_SCENE.instantiate()
	modal.on_ready = func():
		modal.message.text = text
	return modal


func _ready() -> void:
	super._ready()
	on_ready.call()


func enter() -> void:
	super.enter()
	EventService.register_signal(ok.pressed).connect(on_ok_pressed)
	
	ok.grab_focus()

func on_ok_pressed() -> void:
	ViewService.pop_view()
