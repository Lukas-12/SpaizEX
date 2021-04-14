extends Node2D

var time = 0
func _ready():
	$rocket.set_pos(Rocket.position.x,0)
	$rocket.show()

	



func _process(delta):
	time += delta
	if(time > 1.0):
		time = time - 1.0
		if $rocket.position.y < 0:
				Rocket.position.y = $rocket.position.y
				get_tree().change_scene("res://space.tscn")

