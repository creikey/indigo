extends Spatial

export (int, LAYERS_3D_PHYSICS) var raycast_mask = 1
export (NodePath) var to_exclude_path

onready var to_exclude: PhysicsBody = get_node(to_exclude_path)

func _ready():
	$BulletRayCast.add_exception(to_exclude)
	$BulletRayCast.collision_mask = raycast_mask
	set_physics_process(false)

func _input(event):
	if event.is_action_pressed("g_fire"):
		$FireTimer.start()
		$GunshotPlayer.play()
		$BulletRayCast.enabled = true
		set_physics_process(true)

func _physics_process(delta):
	if $BulletRayCast.is_colliding():
		var collider: PhysicsBody = $BulletRayCast.get_collider()
		if collider.is_in_group("hittable"):
			collider.hit()
		$BulletRayCast.enabled = false

func _on_FireTimer_timeout():
	$BulletRayCast.enabled = false
	set_physics_process(false)
