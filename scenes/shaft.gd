class_name Shaft
extends Control

var shaftConnection: String = "None"
var turnSpeed: float = 0
var connectedGear: Node
var gearConnected: bool = false

# Gears call this for the powerShaft defined in Global when they're added
func startGears():
	if gearConnected:
		connectedGear.turnSpeed = turnSpeed
		connectedGear.updateConnectedGears()

# Called on potential drop targets to check if they accept the data  
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is Gear:
		return true
	return false
  
# Called when the drop is performed  
func _drop_data(at_position: Vector2, incoming_data: Variant) -> void:
	if incoming_data is Gear:
		incoming_data.reparent(self)
		connectedGear = incoming_data
		incoming_data.set_modulate_to_normal()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	if shaftConnection == "Power":
		turnSpeed = 6

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees += turnSpeed/2
