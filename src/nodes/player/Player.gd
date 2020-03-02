extends KinematicRewinder

var accel: Vector3 = Vector3(0.0, -9.8, 0.0)
var vel: Vector3 = Vector3()
var rewinder_data = RewinderData.new()

func _physics_process(delta):
	# rewind mechanic management
	if GameState.rewinding:
		set_process_input(false)
		if not rewinder_data.available_transforms():
			return
		global_transform = rewinder_data.pop_transform()
		return
	set_process_input(true)
	rewinder_data.add_transform(global_transform)
	
	# movement
	var forward_backward: float = \
		float(Input.is_action_pressed("g_backward")) -\
		float(Input.is_action_pressed("g_forward"))
	
	var left_right: float = \
		float(Input.is_action_pressed("g_right")) -\
		float(Input.is_action_pressed("g_left"))
	
	# mouse vector attainment
	var width: float = ProjectSettings.get_setting("display/window/size/width")
	var height: float = ProjectSettings.get_setting("display/window/size/height")
	var display_vector: Vector2 = Vector2(width, height)
	
	rotation.y = -(display_vector/2.0).angle_to_point(get_viewport().get_mouse_position()) + PI
	
	# physics
	vel += accel*delta
	
	vel.x = left_right*10.0
	vel.z = forward_backward*10.0
	
	vel = move_and_slide(vel, Vector3(0, 1, 0))
