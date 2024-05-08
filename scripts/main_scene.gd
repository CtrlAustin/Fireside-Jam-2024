extends Node3D

@onready var camera = $camera_rig/Camera3D
@onready var cam_ray = $camera_rig/Camera3D/RayCast3D
@onready var dot = $camera_rig/Camera3D/MeshInstance3D
@onready var tile_grid = $tile_grid
const RAY_LENGTH = 1000
var camera_scale = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var center = tile_grid.get_aabb().size/2
	camera.position = lerp(camera.position,tile_grid.position,1)
	if Input.is_action_just_pressed("scroll_up"):
		var newsize = camera.size - 1
		camera.size = lerp(camera.size,newsize,1)
		print(camera.size)

	if Input.is_action_just_pressed("scroll_down"):
		var newsize = camera.size + 1
		camera.size = lerp(camera.size,newsize,1)
		print(camera.size)

func _physics_process(delta):
	print(dot.position)
	if Input.is_action_just_pressed("left_click"):
		cam_ray.position.x = get_viewport().get_mouse_position().x # look at the mouse
		cam_ray.position.y = get_viewport().get_mouse_position().y # look at the mouse
		dot.position = cam_ray.position # look at the mouse
		dot.position.z = -4
		if cam_ray.is_colliding():
			print(cam_ray.get_collider().get_parent())

func _input(event):
	pass
