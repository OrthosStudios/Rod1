extends Node3D
@onready var audio = $AudioStreamPlayer3D

func _physics_process(delta):
	if position.x > 0:
		audio.play()
	else:
		audio.stop()
