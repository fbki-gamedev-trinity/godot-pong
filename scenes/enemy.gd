extends RigidBody2D

var ball
const SPEED = 30000
func _ready():
	ball = get_node("/root/main/Ball")

func _physics_process(delta):
	var direction = (ball.position - position).normalized()
	
	# move the paddle towards the ball
	linear_velocity.y = direction.y * SPEED * delta
