class_name InputVectorChanged
extends CustomInputEvent

var strength: Vector2


func _init(_action: String, _strength: Vector2) -> void:
	super._init(_action)
	strength = _strength
