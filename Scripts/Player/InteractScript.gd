extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var items = get_overlapping_areas()
	var interactable = false
	for single_area in items:
		if(single_area.has_method("interact")):
			interactable = true
			get_parent().setInteract(single_area)
	
	if(!interactable):
		get_parent().setInteract(null)
		# Only damage nodes that have a function called “damage”
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
