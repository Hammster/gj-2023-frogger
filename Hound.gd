extends Sprite
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	pass

func move():
	var new_dir = rng.randi_range(0,1)
	
	if(new_dir == 0):
		if(self.position.x < 224):
			self.position.x += 32
			self.flip_h = false
	if(new_dir == 1):
		if(self.position.x > 32):
			self.position.x -= 32
			self.flip_h = true
func _on_Timer_timeout():
	move()
