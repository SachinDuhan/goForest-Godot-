class_name State
extends Node

@export
var state: String

@export
var move_speed_x: float = 90.0

@export
var move_speed_y: float = 45.0

@export
var direction_multiplier: float = 1.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: Player

func _enter_state() -> void:
	var frames = load("res://Animations/Player/"+state+".tres")
	parent.animations.set_sprite_frames(frames)
	parent.animations.play(state + "_" + parent.direction)

func _exit_state() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func process_frames(delta: float) -> State:
	return null
