extends Resource

class_name RewinderData

var _transforms: Array = []

func add_transform(new_transform: Transform):
	_transforms.append(new_transform)
	_ensure_array_length()

func available_transforms() -> bool:
	return _transforms.size() >= 1

func pop_transform() -> Transform:
	return _transforms.pop_back()

func _ensure_array_length():
	while _transforms.size() > GameState.FRAMES_PER_SECOND*GameState.REWIND_SECONDS:
		_transforms.pop_front()
