extends VehicleBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass

@export var pwr: float = 1.0

var cmt = false
func _physics_process(delta):
  if Input.is_action_pressed("fwd"):
    print("Moving @ " + str(pwr) + " force")
    engine_force = pwr
  if Input.is_action_pressed("exit"):
    get_tree().quit()
    
    
  else:  
    cmt = false
    
    
