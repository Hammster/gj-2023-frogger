extends Sprite

var spiteSize = 16
var bounding_x = spiteSize * 15
var bounding_y = spiteSize * 8
var grass = null

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.x = bounding_x / 2 - 8
	self.position.y = bounding_y - spiteSize
	grass = get_parent().get_node("Grass")
	grass.position.y = 160 - grass.region_rect.size.y
	print(grass.region_rect.size.y)
	pass # Replace with function body.

func _input(event):
	print(grass.position)
	
	# Input Handling
	if event.is_action_pressed("ui_right") and self.position.x < bounding_x:
		$walk.play()
		position.x += 16
	if event.is_action_pressed("ui_left") and self.position.x > 0:
		$walk.play()
		position.x -= 16
	if event.is_action_pressed("ui_up"):
		$walk.play()
		#position.y -= 16
		grass.position.y += 16
		self.flip_v = false
	if event.is_action_pressed("ui_down") and grass.position.y > -352:
		$walk.play()
		#position.y += 16
		grass.position.y -= 16
		self.flip_v = true
	

	#if self.position.y == bounding_y - 16:
	#	grass.position.y -= bounding_y - spiteSize
	#	self.position.y = 0
	
	# Collision Check

func _on_Area2D_area_entered(area):
	print(area.get_parent().name)
	pass # Replace with function body.
