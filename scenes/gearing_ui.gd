class_name Gearing_UI
extends Control

@export var shaftScene: PackedScene
@export var gearScene: PackedScene

func createGear(x, y, radius):
	var gear = gearScene.instantiate()
	gear.position[0] = x
	gear.position[1] = y
	gear.gearRadius = radius
	Global.gearReferences[Global.gearCount] = gear
	Global.gearCount += 1
	add_child(gear)

func createShaft(x, y, connection):
	var shaft = shaftScene.instantiate()
	shaft.position[0] = x
	shaft.position[1] = y
	shaft.shaftConnection = connection
	if shaft.shaftConnection == "Power":
		Global.powerShaft = shaft
	add_child(shaft)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	createGear(100, 100, 100)
	createGear(200, 100, 100)
	createGear(300, 100, 50)
	createGear(400, 100, 150)
	createShaft(200, 300, "None")
	createShaft(300, 300, "Power")
	createShaft(400, 300, "None")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
