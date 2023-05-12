class_name Game
extends View

const PACKED_SCENE: PackedScene = preload("res://view/game/game.tscn")

@onready var quit: Button = %Quit


static func instance() -> Game:
	return PACKED_SCENE.instantiate()


func enter() -> void:
	super.enter()
	register_signal(quit.pressed).connect(on_quit_pressed)

func on_quit_pressed() -> void:
	MultiplayerService.close_connection()
