extends Node3D

#var tile_scene = preload("res://scenes/tiles/tile.tscn")
@onready var centerpoint = $center_point
var tiles = [] #stores if a tile is active and what plant is placed on it
var grid_width = 10
var grid_height = 10
var indexX = 0
var indexZ = 0
var teststring = " "

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in grid_width: #create a 2d array
		tiles.append([])
		for j in grid_height:
			tiles[i].append(0) #dummy value

	tiles[0][0] = 1
	tiles[1][0] = 1
	tiles[2][0] = 1

	tiles[0][1] = 1
	tiles[1][1] = 1
	tiles[2][1] = 1

	tiles[0][2] = 1
	tiles[1][2] = 1
	tiles[2][2] = 1

	tiles[0][3] = 1
	tiles[1][3] = 1
	tiles[2][3] = 1
	
	for i in tiles:
		teststring += "\n"
		for j in i:
			if j == 1:
				teststring += "1"
				var tile_scene = preload("res://scenes/tiles/tile.tscn")
				var instance = tile_scene.instantiate()
				instance.position.x = indexZ
				instance.position.z = indexX
				instance.position.y = position.y
				instance.unlocked = true
				add_child(instance)
			else:
				teststring += "0"
				var tile_scene = preload("res://scenes/tiles/tile.tscn")
				var instance = tile_scene.instantiate()
				instance.position.x = indexZ
				instance.position.z = indexX
				instance.position.y = position.y
				instance.unlocked = false
				add_child(instance)
			indexX += 1
		indexX = 0
		indexZ += 1

	print(teststring)
	_update_camera()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _update_camera():
	pass
	
