extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _draw():
	for x in range(16):
		for y in range(256):
			draw_rect(Rect2(x * 16, y * 16, x * 16 + 16, y * 16 + 16), "#0000FF", false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_area_entered(area):
	get_tree().change_scene("res://won.tscn")
	pass # Replace with function body.
