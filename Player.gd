extends KinematicBody2D

export (int)var gravity = 4
export (int)var playerSpeed = 50
export (int)var friction = 20 
export (int)var acceleration = 20 
export (int)var jumpHeight = 150
export (int)var minJumpHeight = 40

var velocity = Vector2.ZERO
var bfastFall = false



func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input.x == 0:
		apply_friction()
	else:
		apply_acceleration(input.x)
	
	if is_on_floor():
		bfastFall = false
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -jumpHeight
	else:
		if Input.is_action_just_released("ui_up") and velocity.y < -minJumpHeight:
			velocity.y = -minJumpHeight
	
	if velocity.y > 2:
		apply_gravity()
	
	velocity = move_and_slide(velocity, Vector2.UP)

func apply_gravity():
	velocity.y += gravity
	
func apply_friction():
	velocity.x = move_toward(velocity.x, 0, friction)

func apply_acceleration(inputX):
	velocity.x = move_toward(velocity.x, playerSpeed * inputX, acceleration)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
