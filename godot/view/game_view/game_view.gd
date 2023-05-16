class_name Game
extends View

const PACKED_SCENE: PackedScene = preload("res://view/game_view/game_view.tscn")


static func instance() -> Game:
	return PACKED_SCENE.instantiate()


func enter() -> void:
	super.enter()
	EventService.get_signal(ControllerStartPressed).connect(on_controller_start_pressed)


func on_controller_start_pressed() -> void:
	ViewService.push_view(GamePausedView.instance())
