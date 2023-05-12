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
	host.pressed.connect(MultiplayerService.create_server)
	join.pressed.connect(MultiplayerService.create_client)
	quit.pressed.connect(GameService.quit)
	host.grab_focus()


func exit() -> void:
	super.exit()
	host.pressed.disconnect(MultiplayerService.create_server)
	join.pressed.disconnect(MultiplayerService.create_client)
	quit.pressed.disconnect(GameService.quit)
