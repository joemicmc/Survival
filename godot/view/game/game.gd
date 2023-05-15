class_name Game
extends View

const PACKED_SCENE: PackedScene = preload("res://view/game/game.tscn")


static func instance() -> Game:
	return PACKED_SCENE.instantiate()


func enter() -> void:
	super.enter()
	EventService.get_signal(StartPressed).connect(on_start_pressed)


func on_start_pressed() -> void:
	ViewService.push_view(GamePause.instance())
