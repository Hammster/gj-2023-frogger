extends Sprite

var spiteSize = 16
var bounding_x = spiteSize * 15
var bounding_y = spiteSize * 8
var grass = null
var is_swimming = false
var trunk_stash = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.x = bounding_x / 2 - 8
	self.position.y = bounding_y - spiteSize
	grass = get_parent().get_node("Grass")
	grass.position.y = 160 - grass.region_rect.size.y

func _process(delta):
	deathcheck()

func _input(event):	
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
	if event.is_action_pressed("ui_down") and grass.position.y > -grass.region_rect.size.y + 160:
		$walk.play()
		#position.y += 16
		grass.position.y -= 16
		self.flip_v = true

func deathcheck():
	if is_swimming and trunk_stash == 0:
		print("death W")
		get_tree().change_scene("res://lost.tscn")

func _on_Area2D_area_entered(area):


	if "Trunk" in area.get_parent().name:
		trunk_stash += 1
		
		print("Swim")
	
	if "Truck" in area.get_parent().name:
		$smash.play()
		print("death T")
		get_tree().change_scene("res://lost.tscn")
	if "Hound" in area.get_parent().name:
		$bite.play()
		print("death H")
		get_tree().change_scene("res://lost.tscn")
	if "Water" in area.get_parent().name:
		is_swimming = true
		$Splash.play()
	pass

func _on_Area2D_area_exited(area):
	if "Water" in area.get_parent().name:
		is_swimming = false

	if "Trunk" in area.get_parent().name:
		trunk_stash -= 1
	pass
