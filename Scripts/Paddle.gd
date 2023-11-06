extends CharacterBody2D
class_name Paddle

# movement
@export var max_speed : float
@export var acceleration : float
@export var decceleration : float

var current_speed : float = 0
var direction


func _physics_process(delta):
	direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	if direction:
		current_speed = move_toward(current_speed, max_speed, acceleration)
		velocity.x = current_speed * direction
	else:
		velocity.x = move_toward(velocity.x, 0, decceleration)

	move_and_collide(velocity * delta)
