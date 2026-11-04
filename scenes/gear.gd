class_name Gear
extends Control

var gearTeeth: int = 0
var gearRadius: float = 100
var turnSpeed: float = 0
var connectedShaft: Node
var shaftConnected: bool = false

func _updateTurnSpeed():
	pass

func checkForConflicts():
	for i in Global.gearCount:
		var testGear = Global.gearReferences[i]
		if testGear != self:
			if (position[0] - testGear.position[0])^2 + (position[1] - testGear.position[1])^2 < (gearRadius + testGear.gearRadius)^2:
				return true
	return false

func updateConnectedGears():
	for i in Global.gearCount:
		var testGear = Global.gearReferences[i]
		if testGear != self:
			if (position[0] - testGear.position[0])^2 + (position[1] - testGear.position[1])^2 == (gearRadius + testGear.gearRadius)^2:
				testGear.turnSpeed = -turnSpeed

func attachToShaft():
	if connectedShaft.shaftConnection == "Power":
		turnSpeed = connectedShaft.turnSpeed
		updateConnectedGears()
	else:
		Global.powerShaft.startGears()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	scale[0] = gearRadius/100
	scale[1] = gearRadius/100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
