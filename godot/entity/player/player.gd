class_name Player
extends MultiplayerNode

const PATH = "res://entity/player/player.tscn"
const SPEED := 10.0

@export var target_pos := Vector2.ZERO
@export var colour: Color

@onready var sprite: Sprite2D = %Sprite2D
@onready var camera: Camera2D = %Camera2D
@onready var label: Label = %Label

static func instance(id: int) -> Player:
	var player = preload(PATH).instantiate()
	player.name = str(id)
	player.colour = Color(randf_range(0.25, 1), randf_range(0.25, 1), randf_range(0.25, 1))
	return player

func _enter_tree() -> void:
	set_auth(name.to_int())

func _ready() -> void:
	sprite.self_modulate = colour
	target_pos = sprite.position
	if is_auth():
		camera.make_current()
		label.text = name

func _process(delta: float) -> void:
	if is_auth():
		var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		if direction:
			target_pos += direction * SPEED
	sprite.position = sprite.position.lerp(target_pos, 0.75 * delta)
