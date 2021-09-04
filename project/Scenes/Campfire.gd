extends Area2D




func _on_Campfire_body_entered(body):
	var burnThing = body.get_name()
	print("burn")
	print(burnThing)
