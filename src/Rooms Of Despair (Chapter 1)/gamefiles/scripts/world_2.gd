extends Node3D

func _on_skip_button_pressed():
	get_tree().change_scene_to_file("res://gamefiles/scenes/world_1.tscn")
