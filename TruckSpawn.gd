extends Node2D

var Truck = preload("res://truck.tscn")
export var initial_speed_x = 20

func randomize_timer():
	$Timer.wait_time = rand_range(2, 5)

func _ready():
	randomize_timer()

func _on_Timer_timeout():
	var new_truck = Truck.instance()
	new_truck.speed_x = initial_speed_x
	add_child(new_truck)
	randomize_timer()
