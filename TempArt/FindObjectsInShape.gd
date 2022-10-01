extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	var areas_in_motor = get_overlapping_areas()
	for single_area in areas_in_motor:
		if(single_area.has_method("changeShader")):

			single_area.changeShader()
		# Only damage nodes that have a function called “damage”
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
