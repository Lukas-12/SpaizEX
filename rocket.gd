extends RigidBody2D

export (int) var engine_thrust
export (int) var spin_thrust
export (int) var x
export (int) var y
var bol = true
var thrust = Vector2() # (0,0) am Anfang
var rotation_dir = 0
var screensize 


func _ready():
	screensize = get_viewport().get_visible_rect().size
	
func get_input():
	if Input.is_action_just_released("ui_up"): #Spielt sound
				$RocketSound.stop()	
			
	if Input.is_action_pressed("ui_up"): #Schub nach oben mit sound
		thrust = Vector2(engine_thrust, -10)
		if $RocketSound.is_playing() == false:
			$RocketSound.play()
	else:
		thrust = Vector2()
	rotation_dir = 0
	if Input.is_action_pressed("ui_right"): #nach rechts drehen
		rotation_dir += 10
	if Input.is_action_pressed("ui_left"): #nach links drehen
		rotation_dir -= 10
	
func _process(delta):
	get_input()
	x = position.x
	
func set_pos(x,y):
	position.x = x
	position.y = y
	

	
	
func _integrate_forces(state):
	set_applied_force(thrust.rotated(rotation)) #zum Beschleunigen
	set_applied_torque(rotation_dir * spin_thrust) #zum Drehen
	
	#Wenn Bildschirm verlassen wird, kommt man auf der anderen Seite raus
	var coord = state.get_transform() #holt coords von Rocket
	if coord.origin.x > screensize.x:
		coord.origin.x = 0
	if coord.origin.x < 0:
		coord.origin.x = screensize.x
		
	
	state.set_transform(coord) #Setzt neue coords
