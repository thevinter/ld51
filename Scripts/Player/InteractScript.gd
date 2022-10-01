extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var items = get_overlapping_areas()
	var interactable = false
	var inCamp = false

	for single_area in items:
		if(single_area.has_method("interact")):
			interactable = true
			parent.setInteract(single_area)
		if(single_area.get_parent().name == "Campfire"):

			parent.resting = true
			inCamp = true
			pass
	
	if(!interactable):
		parent.setInteract(null)
	if(!inCamp):
		parent.resting = false
		# Only damage nodes that have a function called “damage”
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
