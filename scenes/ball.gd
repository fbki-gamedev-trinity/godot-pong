extends RigidBody2D


class_name Ball

@export var BALL_SPEED = 30

var ball_speed = BALL_SPEED
var velocity = Vector2.ZERO

func _ready():
	start_ball()

# FIXME: менять linear_velocity не рекомендуется, см. док RigidBody2D
func _physics_process(delta):
	linear_velocity = Vector2.ZERO
	
	var collision = move_and_collide(velocity * ball_speed * delta)
	
	# collision.get_normal() вернёт результат вида:
	# (1, 0)
	# (-1, 0)
	# для ракеток
	#
	# collision.get_collider() вернёт с чем столкнулось
	#
	if collision:
		var other = collision.get_collider()
		var normal = collision.get_normal()
		
		if other in [$"../Player", $"../Enemy"]:
			# -0.5 врезался в верхний угол
			# +0.5 врезался в нижний угол
			var cornerness = (position.y - other.position.y)/other.get_height()
			
			# У игрока другой frame of reference для углов
			if other == $"../Player":
				cornerness = -cornerness
			
			normal = normal.rotated(cornerness)
			
		velocity = velocity.bounce(normal) * 1.02
		

func start_ball():
	await get_tree().create_timer(1).timeout
	velocity.x = [-1, 1][randi() % 2] * BALL_SPEED + randf()*.2*BALL_SPEED
	velocity.y = [-.8, .8][randi() % 2] * BALL_SPEED + randf()*.2*BALL_SPEED
