class_name Game
extends View

const PACKED_SCENE: PackedScene = preload("res://view/game/game.tscn")

@onready var quit: Button = %Quit


static func instance() -> Game:
	return PACKED_SCENE.instantiate()


func enter() -> void:
	super.enter()
	quit.pressed.connect(MultiplayerService.close_connection)


func exit() -> void:
	super.exit()
	quit.pressed.disconnect(MultiplayerService.close_connection)
