class_name Player
extends Node

const SPEED := 200.0

@onready var sprite: Sprite2D = %Sprite2D

static func instance() -> Player:
	return preload("res://entity/player.tscn").instantiate()

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	print(get_multiplayer_authority())

func _process(delta: float) -> void:
	if is_multiplayer_authority():
		var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		if direction:
			print(get_multiplayer_authority(),": ",direction)
			sprite.position += direction * SPEED * delta
