extends VehicleBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass

@export var pwr: float = 1.0
@export var rotation_speed : float = 1
@export var steering_max = deg_to_rad(15)
var cmt = false
func _physics_process(delta):
  if Input.is_action_pressed("fwd"):
        #stop left side
    engine_force = pwr
  else:
    engine_force = 0
    
  if Input.is_action_pressed("back"):
    brake = pwr
  else:
    brake = 0
    
  if Input.is_action_pressed("left"):
    #stop left side
    steering = move_toward( steering , -steering_max , 2*delta)
    #if(linear_velocity.length() < 5):
      #rotate_y(rotation_speed * delta)
    #else:
      #steering = -steering_max
  elif Input.is_action_pressed("right"):
    #if(linear_velocity.length() < 5):
      #rotate_y(-rotation_speed * delta)
    #else:
      #steering = steering_max
    steering = move_toward( steering , steering_max , 2*delta)
  else:
    steering = move_toward( steering , 0 , 5*delta)

    
  if Input.is_action_pressed("exit"):
    get_tree().quit()
  if Input.is_action_pressed("fwd"):
    print("Moving @ " + str(pwr) + " force")
    engine_force = pwr
    
  else:  
    cmt = false
    
    
