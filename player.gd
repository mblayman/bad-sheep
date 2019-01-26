extends KinematicBody2D

const MOVE_UNIT = 64

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up"):
		move_and_collide(Vector2(0, -MOVE_UNIT))
	if Input.is_action_just_pressed("ui_down"):
		move_and_collide(Vector2(0, MOVE_UNIT))
	if Input.is_action_just_pressed("ui_left"):
		move_and_collide(Vector2(-MOVE_UNIT, 0))
	if Input.is_action_just_pressed("ui_right"):
		move_and_collide(Vector2(MOVE_UNIT, 0))