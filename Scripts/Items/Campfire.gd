extends StaticBody2D

var fullness = 1
onready var light = $Light2D
onready var area = $Area2D
export var decay_speed = 10
var interacting = false

func _process(delta):
	if(interacting):
		var item = get_parent().get_node("Player").removeItem()
		if(item > 0):
			fullness += 0.1
			interacting = false
	else:
		fullness -= (delta/(decay_speed))
		light.scale = Vector2(fullness, fullness)
		area.scale = Vector2(fullness, fullness)
		area.monitorable = true if area.scale.x > 0.1 else false
	

func interact():
	interacting = true
