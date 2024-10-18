extends Area2D

func _ready():
	body_exited.connect(body_exited_fn)

func body_exited_fn(body):
	if body is Ball:
		if body.position.x < position.x:
			$"..".player_scored()
		else:
			$"..".enemy_scored()
