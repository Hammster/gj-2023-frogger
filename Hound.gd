extends Sprite
var rng = RandomNumberGenerator.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func move():
	var new_dir = rng.randi_range(0,3)
	print(new_dir)
	if(new_dir == 0):
		self.position.x += 8
	if(new_dir == 1):
		self.position.x -= 8
	if(new_dir == 2):
		self.position.y += 8
	if(new_dir == 3):
		self.position.y -= 8
	pass


func _on_Timer_timeout():
	move()
	pass # Replace with function body.
