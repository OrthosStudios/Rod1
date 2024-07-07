extends Node3D

@onready var player = $player

func _physics_process(delta):
	if player.velocity != 0:
		get_tree().call_group("ghost", "chase", player)
