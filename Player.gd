extends KinematicBody

export var speed = 14

export var fall_acceleration = 75

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