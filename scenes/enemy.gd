extends RigidBody2D

var ball
const SPEED = 30000
func _ready():
	ball = get_node("/root/main/Ball")

func _physics_process(delta):
	if (Global.TYPE == 0):
		var direction = (ball.position - position).normalized()
		linear_velocity.y = direction.y * SPEED * delta
	else:
		var movement = Vector2.ZERO
		var speed = 500
		if Input.is_action_pressed("player_2_move_up"):
			movement = Vector2.UP
		elif Input.is_action_pressed("player_2_move_down"):
			movement = Vector2.DOWN
		linear_velocity = movement * speed;
