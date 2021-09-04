extends Area2D

onready var marshmallow = get_parent().get_node("player/Player/Arm/Sprite2/Marshmallow_K2D/camping-marshmallow")
var marshFire = load("res://Scenes/Fire.tscn")

var donenessSpeed = 1
var burningSpeed = 5

var cooking = false
var burnt = false
var doneness = 0
var burnValue = 0
var burnThreshold = 5
var burnColorDict = {}

func _ready():
	burnColorDict[0] = Color(1, 1, 1)
	burnColorDict[1] = Color(1, 0.98, 0.90)
	burnColorDict[2] = Color(1, 0.96, 0.76)
	burnColorDict[3] = Color(1, 0.94, 0.68)
	burnColorDict[4] = Color(1, 0.92, 0.53)
	burnColorDict[5] = Color(1, 0.9, 0.47)
	burnColorDict[6] = Color(0.7, 0.61, 0.23)
	burnColorDict[7] = Color(0.47, 0.39, 0.12)
	burnColorDict[8] = Color(0.23, 0.19, 0.04)
	burnColorDict[9] = Color(0, 0, 0)

func _on_Campfire_body_entered(body):
	if body.get_name() == "Marshmallow_K2D":
		cooking = true
	
func _on_Campfire_body_exited(body):
	if body.get_name() == "Marshmallow_K2D":
		cooking = false
	burnValue = 0

func _process(delta):
	if cooking:
		if doneness < 9: 
			doneness += donenessSpeed * delta
		if not burnt:
			burnValue += burningSpeed * delta
			marshmallow.modulate = burnColorDict[int(round(doneness))]
	if burnValue >= burnThreshold and not burnt:
		print("Your marshmallow is on fire!")
		marshmallow.add_child(marshFire.instance())
		marshmallow.modulate = Color(1, 1, 1)
		burnt = true

	



