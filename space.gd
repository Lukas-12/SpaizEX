extends Node2D

onready var timer = get_node("Timer")

func _ready():
	$rocket.set_pos(400,200)
	timer.set_wait_time(1)
	timer.start()
 


func _process(delta):
	if $rocket.position.y > $rocket.screensize.y:
		Rocket.position.x = $rocket.position.x
		get_tree().change_scene("res://main.tscn")
		
	
func _on_Timer_timeout():
	if $info.visible == true:
		$info.visible = false
	else:
		$info.visible = true
	
