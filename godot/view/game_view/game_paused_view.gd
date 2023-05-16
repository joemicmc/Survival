class_name GamePausedView
extends PauseView

const PACKED_SCENE: PackedScene = preload("res://view/game_view/game_paused_view.tscn")

@onready var resume: Button = %Resume
@onready var quit: Button = %Quit


static func instance() -> GamePausedView:
	return PACKED_SCENE.instantiate()


func enter() -> void:
	super.enter()
	EventService.register_signal(resume.pressed).connect(on_resume_pressed)
	EventService.register_signal(quit.pressed).connect(on_quit_pressed)
	
	resume.grab_focus()


func on_resume_pressed() -> void:
	ViewService.pop_view()


func on_quit_pressed() -> void:
	MultiplayerService.close_connection()
