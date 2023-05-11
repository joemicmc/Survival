class_name MultiplayerNode
extends EventNode


func _enter_tree() -> void:
	super._enter_tree()


func _ready() -> void:
	super._ready()


func _process(delta: float) -> void:
	super._process(delta)


func set_auth(id: int) -> void:
	set_multiplayer_authority(id)


func is_auth() -> bool:
	if not MultiplayerService.is_multiplayer_connected():
		return false;
	if is_multiplayer_authority():
		return true
	else:
		return false
