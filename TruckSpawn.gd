extends Node2D

var Truck = preload("res://truck.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	add_child( Truck.instance())
	$Timer.wait_time = rng.randf_range(3, 7)
