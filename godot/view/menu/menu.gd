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
			MultiplayerService.create_server())
	
	join.pressed.connect(
		func():
			MultiplayerService.create_client())
	
	exit.pressed.connect(
		func():
			GameService.quit())
	
	host.grab_focus()
