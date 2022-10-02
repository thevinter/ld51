extends Node2D

export var color = "Red/Light2D"
onready var puzzle = get_parent()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pressed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func press():
	if(!pressed && puzzle.isWorking):
		pressed = true
		var timer = Timer.new()
		get_node("Sprite").frame = 1
		add_child(timer)
		timer.one_shot = true
		timer.wait_time = 1
		timer.connect("timeout", self, "turn_off")
		timer.start()
		get_parent().get_node(color).enabled = true
		var c = 0
		if(color == "Green/Light2D"):
			c = 1
		if(color == "Blue/Light2D"):
			c = 2
		get_parent().press_color(c)

func turn_off():
	get_node("Sprite").frame = 0
	get_parent().get_node(color).enabled = false
	pressed = false


func _on_Area2D_area_entered(area):
	press()
