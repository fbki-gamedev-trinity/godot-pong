extends Control

func game_over_show(text):
	get_tree().paused = true
	$VBoxContainer/Label.text = text
	show()
	
func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	hide()
