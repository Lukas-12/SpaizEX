extends Node2D
var random = RandomNumberGenerator.new()
var time = 0
func _ready():
	$rocket.set_pos(Rocket.position.x,0) #Poition bei Szenenwechsel
	$rocket.show()
	$platform.scale.x = random.randf_range(0.2,1.0)
	$platform.draw() #Zufällige Platform
	
	

func _process(delta):
	time += delta
	
	if(time > 1.0):
		time = time - 1.0
		#------------
		#Wenn Bildschirm nach oben verlassen wird
		if $rocket.position.y < 0:
				Rocket.position.y = 550
				Rocket.position.x = $rocket.position.x
				get_tree().change_scene("res://space.tscn")
		#-----------
		#Wenn Rackete ins Wasser fällt = GameOver
		if $rocket.position.y > 575:
				get_tree().change_scene("res://GameOver.tscn")

