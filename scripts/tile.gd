extends Node3D
#@onready var meshobj = $AnimatableBody3D/CollisionShape3D/MeshInstance3D.mesh.surface_get_material(0)
@onready var mesh3d = $MeshInstance3D
@onready var main_scene = get_parent().get_parent()
@onready var plant_sprite = $MeshInstance3D/Sprite3D
@onready var area = $Area3D

@export var sprout : CompressedTexture2D
@export var growing_1 : CompressedTexture2D
@export var growing_2 : CompressedTexture2D
@export var crop : CompressedTexture2D

var unlocked = false
var planted = false
var growing = false
var harvestable = false
var count_down = 20
var grow_time = 20

#@onready var material = mesh.mesh.surface_get_material(some_surface_index)
var rng = RandomNumberGenerator.new()
var hovertrans = Vector3(0,.5,0)
var hovertransdown = Vector3(0,-.5,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if unlocked:
		mesh3d.visible = true
	else:
		mesh3d.visible = false
	if growing:
		count_down-=delta/rng.randf_range(1, 8)
		if (count_down > grow_time/2):
			plant_sprite.texture = sprout
		else:
			plant_sprite.texture = growing_2
			
			
		if (count_down<=0):
			change_to_harvestable()


func change_to_harvestable() -> void:
	harvestable = true
	growing = false
	count_down = grow_time
	plant_sprite.texture = crop

func harvest():
	planted = false
	harvestable = false
	plant_sprite.texture = null
	
func _on_area_3d_mouse_entered():
	mesh3d.position = lerp(mesh3d.position, mesh3d.position+hovertrans,1)


func _on_area_3d_mouse_exited():
	mesh3d.position = lerp(mesh3d.position, mesh3d.position+hovertransdown,1)


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if main_scene.plant_type != 5 && !planted && !harvestable && unlocked:
					planted = true
					growing = true
					print(self.position)
				
				if harvestable:
					harvest()
				if unlocked == false:
					unlocked = true
