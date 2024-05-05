extends Node3D

@onready var camera = $camera_rig/Camera3D
@onready var tile_grid = $tile_grid

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var center = tile_grid.get_aabb().size/2
	camera.position = lerp(camera.position,tile_grid.position,1)
