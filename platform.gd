extends StaticBody2D
var vector
var randomX
var randomY
var randomScale
var random = RandomNumberGenerator.new()


func _ready():
	pass 

#-------------
#Zeichnet eine zufällige Plattform 
func draw():
	random.randomize()
	randomX = random.randi_range(20, 900)
	randomY = random.randi_range(100, 500)
	vector = Vector2(randomX,randomY)
	set_position(vector)
		
	
