extends KinematicBody

export var speed = 14

export var fall_acceleration = 75

export var jump_impulse = 20

var velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_backward"):
		direction.z += 1

	# normalize
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)

	# ground velocity
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	# vertical velocity
	velocity.y -= fall_acceleration * delta

	# jump
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += jump_impulse

	# move
	velocity = move_and_slide(velocity, Vector3.UP)
