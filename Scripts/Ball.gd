extends CharacterBody2D
class_name Ball

const DIRECTION_FIX : float = 0.125

# movement
@export var speed : float
@export var max_speed : float
@export var acceleration : float

var current_speed : float = 0
var direction

var spawn_position : Vector2


func _ready():
	spawn_position = global_position
	reset()


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	var collider = collision.get_collider() if collision else null
	
	if collider is Paddle:
		bounce_off_paddle(collider)
	elif collider:
		bounce_off_walls(collision)


func bounce_off_walls(wall : KinematicCollision2D):
	velocity = velocity.bounce(wall.get_normal())


func bounce_off_paddle(paddle : Paddle):
	var paddle_position = paddle.global_position
	var direction_to_ball = paddle_position.direction_to(global_position)
	
	var current_direction = velocity.normalized()
	var updated_direction = (direction_to_ball - current_direction).normalized()
	
	current_speed = min(current_speed + acceleration, max_speed)
	velocity = updated_direction * current_speed


func reset():
	current_speed = speed
	position = spawn_position
	randomize_direction()


func randomize_direction():
	var random_direction = Vector2()
	
	while is_zero_approx(random_direction.x) or is_zero_approx(random_direction.y):
		random_direction.x = snapped(randf_range(-1,1) , DIRECTION_FIX)
		random_direction.y = snapped(randf_range(-.1,-1) , DIRECTION_FIX)
	
	random_direction = random_direction.normalized()
	velocity = random_direction * current_speed

