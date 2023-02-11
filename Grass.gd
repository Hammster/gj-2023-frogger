extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(area):
	get_tree().change_scene("res://won.tscn")
	pass # Replace with function body.
