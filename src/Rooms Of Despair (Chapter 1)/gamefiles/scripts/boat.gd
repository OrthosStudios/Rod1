extends MeshInstance3D

@onready var anim = $AnimationPlayer

func _ready():
	anim.play("boatAnim")
	
func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://gamefiles/scenes/world_1.tscn")
