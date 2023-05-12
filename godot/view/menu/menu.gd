class_name Menu
extends View

const PACKED_SCENE: PackedScene = preload("res://view/menu/menu.tscn")

@onready var host: Button = %Host
@onready var join: Button = %Join
@onready var quit: Button = %Quit


static func instance() -> Menu:
	return PACKED_SCENE.instantiate()


func enter() -> void:
	super.enter()
	EventService.register_signal(host.pressed).connect(on_host_pressed)
	EventService.register_signal(join.pressed).connect(on_join_pressed)
	EventService.register_signal(quit.pressed).connect(on_quit_pressed)
	
	host.grab_focus()


func on_host_pressed() -> void:
	MultiplayerService.create_server()


func on_join_pressed() -> void:
	MultiplayerService.create_client()


func on_quit_pressed() -> void:
	GameService.quit()
