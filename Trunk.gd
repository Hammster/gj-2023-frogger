extends Sprite

# Declare member variables here. Examples:
var speed_x = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed_x*delta
