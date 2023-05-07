class_name Menu
extends View

const PATH := "res://view/menu/menu.tscn"

@onready var host: Button = %Host
@onready var join: Button = %Join
@onready var exit: Button = %Exit

func _ready() -> void:
	super._ready()
	
	host.pressed.connect(
		func():
			if MultiplayerService.try_create_peer(true):
				ViewService.change_root(Game.PATH))
	
	join.pressed.connect(
		func():
			if MultiplayerService.try_create_peer():
				ViewService.change_root(Game.PATH))
	
	exit.pressed.connect(
		func():
			GameService.quit())
