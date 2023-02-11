extends Sprite

var truck_r = preload("res://truck_r.png")
var truck_l = preload("res://truck_l.png")

# Declare member variables here. Examples:
var speed_x = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	if speed_x > 0:
		set_texture(truck_r)
	else:
		set_texture(truck_l)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed_x*delta
