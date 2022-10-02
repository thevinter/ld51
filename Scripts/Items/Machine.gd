extends StaticBody2D

var isFunctioning = false
var repairPercentage = 0
var isInteracting = false

onready var progress = $ProgressBar
onready var style = progress.get("custom_styles/fg")


func _process(delta):
	progress.value = repairPercentage * 20
	style.bg_color = Color.red if !isFunctioning else Color.green
	
	if (!Input.is_physical_key_pressed(KEY_E)):
		isInteracting = false
	
	if (isInteracting):
		if(repairPercentage > 5):
			isFunctioning = true
		else:
			repairPercentage += delta
	else:
		if(!isFunctioning and repairPercentage > 0):
			repairPercentage -= delta
	print(repairPercentage)


func interact():
	isInteracting = true

