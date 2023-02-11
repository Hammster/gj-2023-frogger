extends Sprite

var spiteSize = 16
var bounding_x = spiteSize * 15
var bounding_y = spiteSize * 8

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.x = bounding_x / 2 - 8
	self.position.y = bounding_y
	pass # Replace with function body.

func _input(event):
	# Input Handling
	if event.is_action_pressed("ui_right") and self.position.x < bounding_x:
		position.x += 16
	if event.is_action_pressed("ui_left") and self.position.x > 0:
		position.x -= 16
	if event.is_action_pressed("ui_up") and self.position.y > 0:
		position.y -= 16
		self.flip_v = false
	if event.is_action_pressed("ui_down") and self.position.y < bounding_y:
		position.y += 16
		self.flip_v = true
	
	# Screen Movement
	if self.position.y == 16:
		get_parent().get_node("Grass").position.y += bounding_y - spiteSize
		self.position.y = bounding_y
		
	# Collision Check
	
