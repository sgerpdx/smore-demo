extends Area2D

onready var marshmallow = get_parent().get_node("player/Player/Arm/Sprite2/Marshmallow_K2D/camping-marshmallow")
var burning = false
var doneness = 0
var burnValue = 0
var burnThreshold = 10


func _on_Campfire_body_entered(body):
	var burnThing = body.is_on_ceiling()
	burning = true
		
	print("burn")
	print(burnThing)
	print(burning)
	
func _on_Campfire_body_exited(body):
	burning = false
	burnValue = 0

func _process(delta):
	if burning:
		doneness += 0.25 * delta
		burnValue += 5 * delta
		print("Done:", doneness)
		print("Burn:", burnValue)
	if burnValue >= burnThreshold:
		marshmallow.modulate = Color(0, 0, 1)
		print("Your marshmallow is on fire!")



