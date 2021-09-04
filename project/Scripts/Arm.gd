extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()

var rotation_dir = 0
onready var player = get_parent()

func get_input():
	rotation_dir = 0
	if Input.is_action_pressed('up'):
		rotation_dir += 1
	if Input.is_action_pressed('down'):
		rotation_dir -= 1

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta


