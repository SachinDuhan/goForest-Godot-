#class_name Player
#extends CharacterBody2D
#
#
#const SPEED = 100.0
#const JUMP_VELOCITY = -400.0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	##if not is_on_floor():
		##velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if Input.is_action_pressed("ui_up"):
		#velocity.y = -1 * SPEED
	#elif Input.is_action_pressed("ui_down"):
		#velocity.y = 1 * SPEED
	#elif Input.is_action_pressed("ui_left"):
		#velocity.x = -1 * SPEED
	#elif Input.is_action_pressed("ui_right"):
		#velocity.x = 1 * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.y = move_toward(velocity.y, 0, SPEED)
#
	#move_and_slide()


class_name Player
extends CharacterBody2D

@export var inv: Inventory

@onready var state_machine: Node = $"StateMachine"
@onready var animations: AnimatedSprite2D = $Animations

var id: String

#@onready var animations: AnimatedSprite2D = $AnimatedSprite2D
var direction = "left_down"

func _ready() -> void:
	state_machine.init(self)
	self.add_to_group("players")
	print(get_tree().get_nodes_in_group("players")[0].direction)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _process(delta: float) -> void:
	state_machine.process_frames(delta)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
