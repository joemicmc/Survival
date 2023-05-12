class_name Player
extends EventNode

const PACKED_SCENE = preload("res://entity/player/player.tscn")
const SPEED := 10.0

@export var target_pos := Vector2.ZERO
@export var colour: Color

var direction := Vector2.ZERO

@onready var sprite: Sprite2D = %Sprite2D
@onready var camera: Camera2D = %Camera2D
@onready var label: Label = %Label


static func instance(id: int) -> Player:
	var player = PACKED_SCENE.instantiate()
	player.name = str(id)
	player.colour = Color(
		randf_range(0.25, 1),
		randf_range(0.25, 1),
		randf_range(0.25, 1))
	return player


func _enter_tree() -> void:
	super._enter_tree()
	set_multiplayer_authority(name.to_int())


func _ready() -> void:
	super._ready()
	EventService.get_signal(ControllerMoveChanged).connect(on_controller_move_changed)
	
	sprite.self_modulate = colour
	target_pos = sprite.position
	
	if is_multiplayer_authority():
		camera.make_current()
		label.text = name


func _process(delta: float) -> void:
	super._process(delta)
	
	if is_multiplayer_authority():
		if direction:
			target_pos += direction * SPEED
	
	sprite.position = sprite.position.lerp(target_pos, 0.75 * delta)
	direction = Vector2.ZERO


func on_controller_move_changed(controller_move_changed: ControllerMoveChanged) -> void:
	direction = controller_move_changed.strength
