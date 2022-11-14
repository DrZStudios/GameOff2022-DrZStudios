extends KinematicBody2D

var velocity = Vector2.ZERO



func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	velocity.y += 2
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = 50
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -50
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -100
	
	velocity = move_and_slide(velocity)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
