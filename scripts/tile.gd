extends Node3D
#@onready var meshobj = $AnimatableBody3D/CollisionShape3D/MeshInstance3D.mesh.surface_get_material(0)
@onready var mesh3d = $MeshInstance3D
#@onready var material = mesh.mesh.surface_get_material(some_surface_index)
var rng = RandomNumberGenerator.new()
var hovertrans = Vector3(0,.5,0)
var hovertransdown = Vector3(0,-.5,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_3d_mouse_entered():
	mesh3d.position = lerp(mesh3d.position, mesh3d.position+hovertrans,1)


func _on_area_3d_mouse_exited():
	mesh3d.position = lerp(mesh3d.position, mesh3d.position+hovertransdown,1)


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
		pass

