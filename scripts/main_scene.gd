extends Node3D

@onready var camera = $camera_rig/Camera3D
@onready var cam_ray = $camera_rig/Camera3D/RayCast3D
@onready var dot = $camera_rig/Camera3D/MeshInstance3D
@onready var tile_grid = $tile_grid
const RAY_LENGTH = 1000
var camera_scale = 8
var plant_type = 0

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

	if Input.is_action_just_pressed("scroll_down"):
		var newsize = camera.size + 1
		camera.size = lerp(camera.size,newsize,1)

func _physics_process(delta):
	if Input.is_action_just_pressed("left_click"):
		cam_ray.position.x = get_viewport().get_mouse_position().x # look at the mouse
		cam_ray.position.y = get_viewport().get_mouse_position().y # look at the mouse
		if cam_ray.is_colliding():
			var instance = dot.instantiate()
			print(cam_ray.get_collider().get_parent())

func _input(event):
	pass


func _on_panel_2_item_selected(index):
	pass #for top bar


func _on_item_list_item_selected(index): # Seeds
	plant_type = index
	print(plant_type)
