class_name Player
extends Node

const SPEED := 10.0

@export var target_pos := Vector2.ZERO
@export var colour: Color

@onready var sprite: Sprite2D = %Sprite2D

static func instance() -> Player:
	return preload("res://entity/player.tscn").instantiate()

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _ready() -> void:
	sprite.modulate = colour
	target_pos = sprite.position

func _process(delta: float) -> void:
	if is_multiplayer_authority():
		var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		if direction:
			target_pos += direction * SPEED
	sprite.position = sprite.position.lerp(target_pos, 0.75 * delta)
