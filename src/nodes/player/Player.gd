extends KinematicBody

var accel: Vector3 = Vector3(0.0, -9.8, 0.0)
var vel: Vector3 = Vector3()

func _physics_process(delta):
	var forward_backward: float = \
		float(Input.is_action_pressed("g_backward")) -\
		float(Input.is_action_pressed("g_forward"))
		
	
	var left_right: float = \
		float(Input.is_action_pressed("g_right")) -\
		float(Input.is_action_pressed("g_left"))
	
	rotation.y = -(get_viewport().size/2.0).angle_to_point(get_viewport().get_mouse_position()) + PI
	
	vel += accel*delta
	
	vel.x = left_right*10.0
	vel.z = forward_backward*10.0
	
	vel = move_and_slide(vel, Vector3(0, 1, 0))
