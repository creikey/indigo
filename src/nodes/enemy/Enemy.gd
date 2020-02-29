extends KinematicBody

const move_smoothing = 8.0

var accel: Vector3 = Vector3(0, -9.8, 0)
var vel: Vector3 = Vector3()

var player_node: Spatial = null

func _physics_process(delta):
	vel += accel*delta
	
	if player_node != null:
		var move_vector = player_node.global_transform.origin - global_transform.origin
		move_vector = move_vector.normalized()
		
		move_vector *= 10.0
		
		move_vector = Vector2(move_vector.x, move_vector.z)
		var vel_2d = Vector2(vel.x, vel.z)
		
		vel_2d = ((move_vector - vel_2d) * move_smoothing*delta) + vel_2d
		
		vel.x = vel_2d.x
		vel.z = vel_2d.y
	
	vel = move_and_slide(vel, Vector3(0, 1, 0))

func _on_PlayerDetector_body_entered(body):
	if body.is_in_group("player"):
		player_node = body

func hit():
	vel = -2.0*vel

func _on_PlayerDetector_body_exited(body):
	if body == player_node:
		player_node = null
		vel.x = 0.0
		vel.z = 0.0
