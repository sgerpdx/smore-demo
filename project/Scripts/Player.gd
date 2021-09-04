extends KinematicBody2D


var velocity = Vector2(0, 0)
const decelerationFactor = 1
const speed = 300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("right") and Input.is_action_pressed("left"):
		velocity.x = 0
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else :
		velocity.x = 0
	move_and_slide(velocity)
