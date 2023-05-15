class_name InputChanged
extends CustomInputEvent

var strength: float


func _init(_action: String, _strength: float) -> void:
	super._init(_action)
	strength = _strength
