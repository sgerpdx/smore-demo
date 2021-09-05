extends Area2D

onready var marshmallow = get_parent().get_node("player/Player/Arm/Stick/Marshmallow_K2D")
onready var stick = get_parent().get_node("player/Player/Arm/Stick")
onready var campfire = get_parent().get_node("Campfire")
onready var tableSprite = get_node("Sprite")

func _on_Table_body_entered(body):
	if body.get_name() == "Marshmallow_K2D" and not campfire.burnt and campfire.doneness > 0:
		tableSprite.texture = load("res://Assets/camping-smore-finished.png")
		print(stick, marshmallow)
		stick.remove_child(marshmallow)
		tableSprite.add_child(marshmallow)
		marshmallow.position.x = -8
		marshmallow.position.y = -40
