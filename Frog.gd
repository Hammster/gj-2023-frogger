extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.x = 0
	self.position.y = 0
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_right"):
		print("R");
		position.x += 16
	if event.is_action_pressed("ui_left"):
		print("L");
		position.x -= 16
	if event.is_action_pressed("ui_up"):
		print("U");
		position.y -= 16
	if event.is_action_pressed("ui_down"):
		print("D");
		position.y += 16
