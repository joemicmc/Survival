class_name Modal
extends View

const PACKED_SCENE: PackedScene = preload("res://view/modal/modal.tscn")

var text: String

@onready var message: Label = %Message
@onready var ok: Button = %OK


static func instance(_text: String) -> Modal:
	var modal = PACKED_SCENE.instantiate()
	modal.text = _text
	return modal


func _ready() -> void:
	super._ready()
	message.text = text


func enter() -> void:
	super.enter()
	ok.pressed.connect(ViewService.pop_modal)
	ok.grab_focus()


func exit() -> void:
	ok.pressed.disconnect(ViewService.pop_modal)