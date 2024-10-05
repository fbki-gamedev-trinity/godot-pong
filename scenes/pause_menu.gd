extends Control

func _process(_delta):
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		get_tree().paused = true
		show()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		get_tree().paused = false
		hide()

func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	hide()


func _on_to_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	hide()
