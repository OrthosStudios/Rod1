extends Node3D

func _physics_process(delta):
	self.rotation.y += 1.0 * delta
