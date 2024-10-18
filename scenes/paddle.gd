extends RigidBody2D

class_name Paddle

@export var speed = 500

# FIXME: менять linear_velocity не рекомендуется, см. док RigidBody2D
func _physics_process(_delta):
	var movement = Vector2.ZERO
	if Input.is_action_pressed("player_1_move_up"):
		movement = Vector2.UP
	elif Input.is_action_pressed("player_1_move_down"):
		movement = Vector2.DOWN
	
	linear_velocity = movement * speed;

func get_height():
	return $CollisionShape2D.shape.size.y
