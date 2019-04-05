extends Area2D

func _ready():
	set_process(false)

func _process(delta):
	
	var mouse = get_global_mouse_position()
	
	var come_to: Vector2 = mouse
	
	self.position = come_to 
	
	if Input.is_mouse_button_pressed( 1 ) or Input.is_mouse_button_pressed( 2 ) or Input.is_mouse_button_pressed( 3 ):
		for area in get_overlapping_areas():
			if area.is_in_group("target"):
				area.destroy();