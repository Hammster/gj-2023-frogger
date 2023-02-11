extends Sprite


var spiteSize = 16
var bounding_x = spiteSize * 15
var bounding_y = spiteSize * 8
var grass = null
var is_swimming = false
var trunk_stash = 0

var Won = preload("res://won.tscn")
var Lost = preload("res://lost.tscn")

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
		get_node("../walk").play()
		position.x += 16
	if event.is_action_pressed("ui_left") and self.position.x > 0:
		get_node("../walk").play()
		position.x -= 16
	if event.is_action_pressed("ui_up"):
		get_node("../walk").play()
		#position.y -= 16
		grass.position.y += 16
		self.flip_v = false
	if event.is_action_pressed("ui_down") and grass.position.y > -grass.region_rect.size.y + 160:
		get_node("../walk").play()
		#position.y += 16
		grass.position.y -= 16
		self.flip_v = true

func deathcheck():
	if is_swimming and trunk_stash == 0:
		get_node("../Splash").play()
		death()

func death():
	get_node("/root/GameMap/BRMusic").stop()
	var map = get_node("/root/GameMap")
	map.remove_child(grass)
	$ClearTimer.start()

func _on_Area2D_area_entered(area):
	if "Trunk" in area.get_parent().name:
		trunk_stash += 1
	
	if "Truck" in area.get_parent().name:
		get_node("../smash").play()
		death()
	if "Hound" in area.get_parent().name:
		get_node("../bite").play()
		death()
	if "Water" in area.get_parent().name:
		is_swimming = true

func _on_Area2D_area_exited(area):
	if "Water" in area.get_parent().name:
		is_swimming = false

	if "Trunk" in area.get_parent().name:
		trunk_stash -= 1
	pass

func _on_ClearTimer_timeout():
	get_tree().change_scene("res://lost.tscn")
	pass
