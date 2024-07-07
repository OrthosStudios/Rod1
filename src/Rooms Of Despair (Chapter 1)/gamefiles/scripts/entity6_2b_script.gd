# This Script Is  Written By MD Mushfique Farhan Nabir For Orthos Studios

extends CharacterBody3D

@onready var agent = $NavigationAgent3D
@onready var anim = $AnimationPlayer
@export var moveSpeed = 2.5
@export var player_path : NodePath
var player 
func _ready():
	player = get_node(player_path)
	anim.play("otherAnim")
	
func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = agent.get_next_path_position()
	var newVel = (next_location - current_location).normalized() * moveSpeed
	velocity = velocity.move_toward(newVel, 0.25)
	look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)
	move_and_slide()

func chase(target):
	agent.set_target_position(target.global_position)


func _on_navigation_agent_3d_target_reached():
	get_tree().change_scene_to_file("res://gamefiles/scenes/death_scene.tscn")
