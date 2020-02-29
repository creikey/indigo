extends Camera

export (NodePath) var player_path

onready var player: Spatial = get_node(player_path)

func _process(delta):
	global_transform.origin.x = player.global_transform.origin.x
	global_transform.origin.z = player.global_transform.origin.z
