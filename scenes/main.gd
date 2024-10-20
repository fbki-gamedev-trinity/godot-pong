extends Node2D

var player_points = 0
var enemy_points = 0

@onready var enemy_paddle = $Enemy
@onready var player_paddle = $Player
@onready var ball = $Ball
@onready var UI = $UI

func player_scored() -> void:
	player_points += 1
	UI.update_player_point(player_points)
	test_win_objective()

func enemy_scored() -> void:
	enemy_points += 1
	UI.update_enemy_points(enemy_points)
	test_win_objective()

func test_win_objective():
	if player_points >= Global.OBJECTIVE:
		if Global.TYPE == 0:
			$UI/GameOver.game_over_show("Победил игрок")
		else:
			$UI/GameOver.game_over_show("Победил правый игрок")
	elif enemy_points >= Global.OBJECTIVE:
		if Global.TYPE == 0:
			$UI/GameOver.game_over_show("Победил компьютер")
		else:
			$UI/GameOver.game_over_show("Победил левый игрок")
	else:
		reset_game_state()
		ball.start_ball()

# Сбросить состояние игры но не перезапускать
func reset_game_state():
	enemy_paddle.global_position.y = 0
	player_paddle.global_position.y = 0
	ball.velocity = Vector2.ZERO
	enemy_paddle.linear_velocity = Vector2.ZERO
	player_paddle.linear_velocity = Vector2.ZERO
	ball.global_position = Vector2.ZERO
	
