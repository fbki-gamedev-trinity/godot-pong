extends Control

func transition_to_game_scene(type: int):
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	Global.TYPE = type
	Global.OBJECTIVE = $MarginContainer/VBoxContainer/PlayUntil.value

func _on_one_player_pressed() -> void:
	transition_to_game_scene(0)

func _on_two_players_pressed() -> void:
	transition_to_game_scene(1)
