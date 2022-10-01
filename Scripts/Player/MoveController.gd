extends KinematicBody2D

const MAX_SPEED = 100
const ACCELERATION = 500
const FRICTION = 500

var velocity = Vector2.ZERO
var gettingBigger = false
var initialTransform = null

var interactableItem = null

onready var pulse = $Light2D
onready var pulseCollision = $Light2D/Area2D/CollisionShape2D

func _physics_process(delta):
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if(input != Vector2.ZERO):
		velocity = velocity.move_toward(input * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)

func _process(delta):
	if(Input.is_physical_key_pressed(KEY_SPACE) and !gettingBigger):
		initialTransform = global_position
		gettingBigger = true
	if(Input.is_action_just_pressed("ui_select") and interactableItem != null):
		interactableItem.interact()
	
	if(gettingBigger):
		makeBigger(delta)


func makeBigger(delta):
	if(pulse.scale.x < 0.8):
		pulse.scale = Vector2(pulse.scale.x + delta / 2, pulse.scale.y + delta /2)
		pulse.global_position = initialTransform
		pulseCollision.shape.radius += delta * 500000
	else:
		pulse.scale = Vector2(0, 0.0)
		pulseCollision.shape.radius = 0
		gettingBigger = false
		pulse.global_position = global_position

func setInteract(item):
	interactableItem = item
