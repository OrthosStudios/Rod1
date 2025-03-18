# This Is Written By MD Mushfique Farhan Nabir For Orthos Studios
extends Node2D

@onready var time = $Timer

func _ready():
	time.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://gamefiles/scenes/menu.tscn")
