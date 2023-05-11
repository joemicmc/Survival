class_name Menu
extends View

const PACKED_SCENE: PackedScene = preload("res://view/menu/menu.tscn")

@onready var host: Button = %Host
@onready var join: Button = %Join
@onready var exit: Button = %Exit


func _ready() -> void:
	super._ready()
	
	host.pressed.connect(
		func():
			if MultiplayerService.try_create_peer(true):
				ViewService.change_view_to(Game.PACKED_SCENE))
	
	join.pressed.connect(
		func():
			if MultiplayerService.try_create_peer():
				ViewService.change_view_to(Game.PACKED_SCENE))
	
	exit.pressed.connect(
		func():
			GameService.quit())
	
	host.grab_focus()
