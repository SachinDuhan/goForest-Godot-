extends State

@export
var walk_state: State

func _enter_state():
	super()
	parent.velocity.x = move_toward(parent.velocity.x, 0, move_speed_x)
	parent.velocity.y = move_toward(parent.velocity.y, 0, move_speed_y)

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("move_left_up") or Input.is_action_pressed("move_right_up") or Input.is_action_pressed("move_left_down") or Input.is_action_pressed("move_right_down"):
		return walk_state
	return null

func process_physics(delta: float) -> State:
	#if not parent.is_on_floor():
		#parent.velocity.y += gravity * delta
	#parent.move_and_slide()
	return null
