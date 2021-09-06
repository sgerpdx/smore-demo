extends Node2D

onready var message = get_parent().get_node("Feedback/SkyText")

func _process(delta):
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		message.text = ""
