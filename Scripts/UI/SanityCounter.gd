extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var val = "sanity"

onready var player = get_parent().get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	text = val + ": " + str(int(player.get(val)))
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
