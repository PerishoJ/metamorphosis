extends VehicleBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass

@export var engine_force_value: float = 40.0
@export var rotation_speed : float = 1
@export var steering_max = deg_to_rad(15)
@export var turn_speed = 0.5;
@export var brake_force_max = 30;
var cmt = false
func _physics_process(delta):
  if Input.is_action_pressed("fwd"):
    var speed := linear_velocity.length()
    if speed < 5.0 and not is_zero_approx(speed):
      engine_force = clampf(engine_force_value * 5.0 / speed, 0.0, 100.0)
    else:
      engine_force = engine_force_value
  else:
    engine_force =  move_toward(engine_force,0,8*delta) 
    
  if Input.is_action_pressed("back"):
    brake = move_toward ( brake, brake_force_max, 2*delta )
  else:
    brake = 0
    
  if Input.is_action_pressed("left"):
    #stop left side
    steering = move_toward( steering , -steering_max , turn_speed*delta)
    #if(linear_velocity.length() < 5):
      #rotate_y(rotation_speed * delta)
    #else:
      #steering = -steering_max
  elif Input.is_action_pressed("right"):
    #if(linear_velocity.length() < 5):
      #rotate_y(-rotation_speed * delta)
    #else:
      #steering = steering_max
    steering = move_toward( steering , steering_max , turn_speed*delta)
  else:
    steering = move_toward( steering , 0 , turn_speed/2*delta)

    
  if Input.is_action_pressed("exit"):
    get_tree().quit()
    
  else:  
    cmt = false
    
    
