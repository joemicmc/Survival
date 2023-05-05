class_name Player
extends Node

@onready var sprite: Sprite2D = %Sprite2D

static func instance() -> Player:
	return preload("res://entity/player.tscn").instantiate()
