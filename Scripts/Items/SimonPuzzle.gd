extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var isWorking = false
var sequence = [0,0,1]
var i = 0
var playerPressedIndex = 0
var node = ""
var globalTimer = Timer.new()

func _ready():
	pass # Replace with function body.

func getWorking():
	return isWorking


func puzzle_start():
	isWorking = true
	add_child(globalTimer)
	globalTimer.one_shot = false
	globalTimer.wait_time = 3
	globalTimer.connect("timeout", self, "puzzle_advance")
	globalTimer.start()
	
func error():
	var timer = Timer.new()
	add_child(timer)
	get_node("Red/Light2D").enabled = true
	get_node("Red/Light2D").color = Color.red
	get_node("Green/Light2D").enabled = true
	get_node("Green/Light2D").color = Color.red
	get_node("Blue/Light2D").enabled = true
	get_node("Blue/Light2D").color = Color.red
	timer.one_shot = true
	timer.wait_time = 1
	timer.connect("timeout", self, "error_lights")
	timer.start()
	globalTimer.stop()
	isWorking = false
	i = 0
	print("Wrong")
	
func error_lights():
	get_node("Red/Light2D").enabled = false
	get_node("Green/Light2D").enabled = false
	get_node("Green/Light2D").color = Color.green
	get_node("Blue/Light2D").enabled = false
	get_node("Blue/Light2D").color = Color.blue
	
func success():
	var timer = Timer.new()
	add_child(timer)
	get_node("Red/Light2D").enabled = true
	get_node("Red/Light2D").color = Color.green
	get_node("Green/Light2D").enabled = true
	get_node("Green/Light2D").color = Color.green
	get_node("Blue/Light2D").enabled = true
	get_node("Blue/Light2D").color = Color.green
	timer.one_shot = true
	timer.wait_time = 1
	timer.connect("timeout", self, "error_lights")
	timer.start()
	globalTimer.stop()
	isWorking = false
	i = 0
	print("Success")

func press_color(color):
	if(color == sequence[playerPressedIndex]):
		playerPressedIndex+=1
	else:
		error()
	if(playerPressedIndex == len(sequence)):
		success()

func puzzle_advance():
	print("advancing")
	if(i >= len(sequence)):
		globalTimer.stop()
		i=0
	else:
		var l = sequence[i]
		if(l == 0):
			node = "Red/Light2D"
		if(l == 1):
			node = "Green/Light2D"
		if(l == 2):
			node = "Blue/Light2D"
		get_node(node).enabled = true
		var timer = Timer.new()
		add_child(timer)
		timer.one_shot = true
		timer.wait_time = 1
		timer.connect("timeout", self, "turn_off")
		timer.start()
		i+=1
	
func turn_off():
	get_node(node).enabled = false
