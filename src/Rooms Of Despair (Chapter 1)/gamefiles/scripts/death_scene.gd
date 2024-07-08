# This Script Is Written By Nabir14 For Orthos Studios
extends Node2D

@onready var audio = $AudioStreamPlayer2D

func _ready():
	audio.play()

func _on_audio_stream_player_2d_finished():
	get_tree().quit()
