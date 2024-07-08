# This Script Written By Mushfique Farhan Nabir For Orthos Studios
extends CharacterBody3D

@onready var cutscene = $cutscene
@onready var body = $CollisionShape3D
@onready var playerHead = $head
@onready var torch = $torch
@onready var raycast = $head/RayCast3D
@onready var grabButton = $grabButton
@onready var glitchButton = $glitchButton
@onready var glitchShader = $CanvasLayer/glitch
@onready var ui = $"Virtual Joystick"
@onready var noiseTimer1 = $Timers/noiseTimer1
@onready var normalCam = $head/Camera3D
@onready var noiseTimer2 = $Timers/noiseTimer2
@onready var noiseTimer3 = $Timers/noiseTimer3
@onready var blackMask = $CanvasLayer/blackMask
@onready var deathRay = $head/deathRay
var axisTypeStatus
var axisType
var maxTouchIgnore = 512
@export var playerSpeed = 5.0
var lerpSpeed = 10.0
var direction = Vector3.ZERO
var gravity = 9.8

const mouseSensitivity = 0.25

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	# Mouse Controller
	if event is InputEventMouseMotion:
		if axisTypeStatus == 0:
			axisType = event.position.z
		else:
			axisType = event.position.x
		if axisType > maxTouchIgnore:
			rotate_y(deg_to_rad(-event.relative.x * mouseSensitivity))
			playerHead.rotate_x(deg_to_rad(-event.relative.y * mouseSensitivity))
			playerHead.rotation.x = clamp(playerHead.rotation.x, deg_to_rad(-44), deg_to_rad(44))

func _physics_process(delta):
	# Check If Player Is Colliding With The Any Area So He Can Die (Game Over)
	if deathRay.is_colliding():
		get_tree().change_scene_to_file("res://gamefiles/scenes/game_over_scene.tscn")
		
	# Player Controller
	if not is_on_floor():
		velocity.y -= gravity * delta
	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackward")
	direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta * lerpSpeed)
	
	if direction:
		velocity.x = direction.x * playerSpeed
		velocity.z = direction.z * playerSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, playerSpeed)
		velocity.z = move_toward(velocity.z, 0, playerSpeed)
		
	# Code To Let The Player Pick The Dead Body (SIKE! HE ENTERS MAZE LEVEL)
	if raycast.is_colliding():
		grabButton.visible = true
		if grabButton.is_pressed():
			glitchButton.visible = true
			glitchShader.visible = true
			ui.visible = false
			maxTouchIgnore = 65535
			axisType = 0
			playerSpeed = 0.0
		if glitchButton.is_pressed():
			blackMask.visible = true
			noiseTimer1.start()
			glitchShader.visible = false
			glitchButton.visible = false
	else:
		grabButton.visible = false
	move_and_slide()

# Table Cutscene
func _on_noise_timer_1_timeout():
	blackMask.visible = false
	cutscene.visible = true
	noiseTimer2.start()

func _on_noise_timer_2_timeout():
	cutscene.visible = false
	blackMask.visible = true
	noiseTimer3.start()
	
func _on_noise_timer_3_timeout():
	blackMask.visible = false
	ui.visible = true
	axisType = 1
	maxTouchIgnore = 1024
	playerSpeed = 5.0
	get_tree().change_scene_to_file("res://gamefiles/scenes/maze_map.tscn")
