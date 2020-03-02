extends Spatial

func _ready():
	$TrailFog.material_override = $TrailFog.material_override.duplicate(true)
