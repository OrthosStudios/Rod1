extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://gamefiles/scenes/world_2.tscn")

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://gamefiles/scenes/credits.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
