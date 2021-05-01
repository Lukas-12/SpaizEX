extends Node2D

onready var timer = get_node("Timer")

func _ready():
	if Rocket.bol == true:
		Rocket.position.x = 500
		Rocket.position.y = 250
		Rocket.bol = false
	
	$rocket.set_pos(Rocket.position.x,Rocket.position.y) #Aktuelle Rocket Position
	timer.set_wait_time(1) #Startet Timer für Nachricht
	timer.start()
 

#-------------
#Wenn das untere Ende des Space Bildschirm erreicht wird
func _process(delta):
	if $rocket.position.y > $rocket.screensize.y:
		Rocket.position.x = $rocket.position.x
		Rocket.rotation_dir = $rocket.rotation_dir
		Rocket.thrust = $rocket.thrust
		get_tree().change_scene("res://main.tscn")
		

#----------------------
# Blinkende Nachricht
func _on_Timer_timeout():
	if $info.visible == true:
		$info.visible = false
	else:
		$info.visible = true
	
