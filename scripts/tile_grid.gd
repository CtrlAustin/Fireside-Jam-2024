extends Node3D

var tile_scene = preload("res://scenes/tiles/tile.tscn")
@onready var centerpoint = $center_point
var grid_size = [3,3]
var centerpos = [1,1]

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var tile_count = grid_size[0] + grid_size[1]
	var total_position = Vector3.ZERO
	
	for i in grid_size[0]:
		for j in grid_size[1]:
			var instance = tile_scene.instantiate()
			instance.position.x = j#*grid_size[0]
			instance.position.z = i#*grid_size[0]
			#instance.position.z = i*grid_size[1]
			instance.position.y = position.y#+rng.randf_range(0, .25)
			add_child(instance)
			_update_camera()
			print(j)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _update_camera():
	pass
	
