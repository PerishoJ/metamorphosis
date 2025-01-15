extends Label
@export var vehicle: VehicleBody3D
var MPS_TO_MPH = 2.23693629

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  text = "Speed: " + str( round( vehicle.linear_velocity.length() * MPS_TO_MPH)  ) + " mph\n" \
    + "Angle: " + str(round( rad_to_deg(vehicle.rotation.y) ) ) + "\n" \
    + "Steering Angle: " + str(round( rad_to_deg(vehicle.steering) ) )
    
  pass
