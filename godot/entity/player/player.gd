class_name Player
extends EventNode

const PACKED_SCENE = preload("res://entity/player/player.tscn")
const SPEED :=100.0

enum Facing {
	LEFT,
	RIGHT,
}

enum State {
	IDLE,
	MOVE,
}

@export var target_pos := Vector2.ZERO
@export var state := State.IDLE
@export var facing := Facing.RIGHT

var on_ready: Callable
var direction := Vector2.ZERO

@onready var body: CharacterBody2D = %CharacterBody2D
@onready var sprite: AnimatedSprite2D = %AnimatedSprite2D
@onready var camera: Camera2D = %Camera2D


static func instance(id: int) -> Player:
	var player = PACKED_SCENE.instantiate()
	player.name = str(id)
	player.on_ready = func():
		player.sprite.self_modulate = Color(
			randf_range(0.25, 1),
			randf_range(0.25, 1),
			randf_range(0.25, 1))
		player.target_pos = player.sprite.position
	return player


func _enter_tree() -> void:
	super._enter_tree()
	set_multiplayer_authority(name.to_int())


func _ready() -> void:
	super._ready()
	EventService.get_signal(ControllerMoveChanged).connect(on_controller_move_changed)
	
	if multiplayer.is_server():
		on_ready.call()
	
	if is_multiplayer_authority():
		camera.make_current()
		
	sprite.play()


func _process(delta: float) -> void:
	super._process(delta)
	
	if is_multiplayer_authority():
		if direction:
			state = State.MOVE
			if direction.x > 0:
				facing = Facing.RIGHT
			elif direction.x < 0:
				facing = Facing.LEFT
			body.velocity = direction * SPEED
			body.move_and_slide()
			target_pos = body.position
		else:
			state = State.IDLE
	else:
		body.position = target_pos
	
	match state:
		State.MOVE:
			sprite.animation = "move"
		State.IDLE:
			sprite.animation = "idle"
	
	match facing:
		Facing.LEFT:
			sprite.flip_h = true
		Facing.RIGHT:
			sprite.flip_h = false
	
	sprite.position = sprite.position.lerp(target_pos, 0.5)
	direction = Vector2.ZERO


func on_controller_move_changed(controller_move_changed: ControllerMoveChanged) -> void:
	direction = controller_move_changed.strength
