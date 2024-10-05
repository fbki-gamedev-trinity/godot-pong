extends RigidBody2D


class_name Ball

@export var BALL_SPEED = 30

var ball_speed = BALL_SPEED
var velocity = Vector2.ZERO

func _ready():
	start_ball()
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * ball_speed * delta)
	
	linear_velocity = Vector2.ZERO
	
	if(collision):
		velocity =  velocity.bounce(collision.get_normal()) * 1.02
		

func start_ball():
	await get_tree().create_timer(1).timeout
	velocity.x = [-1, 1][randi() % 2] * BALL_SPEED
	velocity.y = [-.8, .8][randi() % 2] * BALL_SPEED
