extends Node3D

@export var player_path : NodePath
var player

func _ready():
	player = get_node(player_path)

func _physics_process(delta):
	get_tree().call_group("ghost", "chase", player)
