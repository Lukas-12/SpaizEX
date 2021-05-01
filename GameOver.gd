extends Node2D
onready var timer = get_node("Timer")
func _ready():
	timer.set_wait_time(5) #Startet Timer für Nachricht
	timer.start()
	



func _on_Timer_ready():
	pass # Replace with function body.


func _on_Timer_timeout():
	get_tree().change_scene("res://Menue.tscn")
