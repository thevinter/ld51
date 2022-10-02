extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent()

func _process(delta):
	text = "E" if player.interactableItem != null else ""
