extends Node

const FRAMES_PER_SECOND = 60
const REWIND_SECONDS = 10

var rewinding: bool = false

func _input(event):
	if event.is_action_pressed("g_rewind"):
		GameState.rewinding = !GameState.rewinding

func _on_scene_change():
	rewinding = false

func change_scene(new_scene_path: String):
	_on_scene_change()
	get_tree().change_scene(new_scene_path)
