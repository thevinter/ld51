extends Sprite

var _timer = null
var colorSet = false
onready var light = get_parent().get_node("Light2D")

func _process(delta):
	if(light != null and light.energy > 0):
		light.energy -= delta * 2
	pass
	#	var currColor = material.get_shader_param("outline_color_2")
#
#		if(currColor[3] > 0): 
#			material.set_shader_param("outline_color", Color(0, 1, 0, currColor[3]-delta ))
#			material.set_shader_param("outline_color_2", Color(0, 1, 0, currColor[3]-delta ))
#		else:
#			material.set_shader_param("outline_color", Color(0, 1, 0, 0))
#			material.set_shader_param("outline_color_2", Color(0, 1, 0, 0))



func _on_Timer_timeout():

	if(light != null):
		light.energy = 1
	#var color = Color.green
	#material.set_shader_param("outline_color", color)
	#material.set_shader_param("outline_color_2", color)
	pass
