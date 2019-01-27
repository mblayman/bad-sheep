extends KinematicBody2D

const MOVE_UNIT = 64

# Directions
const UP = 1
const DOWN = 2
const LEFT = 3
const RIGHT = 4

# States
const LOOKING = 1
const PATH_PICKING = 2
const WAITING = 3

var state = LOOKING
var direction = DOWN
var next_direction

var movements = {
	UP: Vector2(0, -MOVE_UNIT),
	DOWN: Vector2(0, MOVE_UNIT),
	LEFT: Vector2(-MOVE_UNIT, 0),
	RIGHT: Vector2(MOVE_UNIT, 0),
}

func _process(delta):
	if state == LOOKING:
		_handle_LOOKING()
	elif state == PATH_PICKING:
		if Input.is_action_just_pressed("ui_up"):
			_move(UP)
		if Input.is_action_just_pressed("ui_down"):
			_move(DOWN)
		if Input.is_action_just_pressed("ui_left"):
			_move(LEFT)
		if Input.is_action_just_pressed("ui_right"):
			_move(RIGHT)

func _handle_LOOKING():
	# Reset next direction from previous process call.
	next_direction = null

	if Input.is_action_just_pressed("ui_up"):
		next_direction = UP
		print("Looking UP")
	if Input.is_action_just_pressed("ui_down"):
		next_direction = DOWN
		print("Looking DOWN")
	if Input.is_action_just_pressed("ui_left"):
		next_direction = LEFT
		print("Looking LEFT")
	if Input.is_action_just_pressed("ui_right"):
		next_direction = RIGHT
		print("Looking RIGHT")

	# The player has not selected anything.
	if not next_direction:
		return

	# When the directions align, the player wants to move.
	if direction == next_direction:
		#print("switching to PATH_PICKING")
		state = PATH_PICKING
		_move(direction)
	else:
		#print("direction to next direction")
		# Otherwise, make them face that way.
		direction = next_direction

func _move(direction):
	move_and_collide(movements[direction])

func _on_start_player_turn():
	print("Player is starting player turn.")