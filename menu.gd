extends Control


func _on_one_player_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	Global.TYPE = 0


func _on_two_players_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	Global.TYPE = 1
