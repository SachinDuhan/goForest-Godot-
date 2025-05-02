extends State


@export
var idle_state: State

var move = true

func _enter_state():
	super()
	move = true

func process_frames(delta: float) -> State:
	parent.animations.play(state + "_" + parent.direction)
	if Input.is_action_pressed("move_left_down"):
		parent.direction = "left_down"
		
	elif Input.is_action_pressed("move_right_up"):
		parent.direction = "right_up"
		
	elif Input.is_action_pressed("move_left_up"):
		parent.direction = "left_up"
		
	elif Input.is_action_pressed("move_right_down"):
		parent.direction = "right_down"
		
	else:
		move = false
		return idle_state
	
	move_player()
	parent.move_and_slide()
	
	return null

func move_player():
	if parent.direction == "left_down":
		parent.velocity.x = -direction_multiplier * move_speed_x
		parent.velocity.y = direction_multiplier * move_speed_y
	elif parent.direction == "left_up":
		parent.velocity.x = -direction_multiplier * move_speed_x
		parent.velocity.y = -direction_multiplier * move_speed_y
	elif parent.direction == "right_up":
		parent.velocity.x = direction_multiplier * move_speed_x
		parent.velocity.y = -direction_multiplier * move_speed_y
	elif parent.direction == "right_down":
		parent.velocity.x = direction_multiplier * move_speed_x
		parent.velocity.y = direction_multiplier * move_speed_y
	else:
		move = false
