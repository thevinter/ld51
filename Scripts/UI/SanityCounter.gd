extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_parent().get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	text = "Sanity: " + str(int(player.sanity))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
