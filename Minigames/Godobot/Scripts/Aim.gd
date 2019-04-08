extends Area2D

var just_pressed: bool = true

func _ready():
	set_process(false)

func _process(delta):
	
	var mouse = get_global_mouse_position()
	
	var come_to: Vector2 = mouse
	
	self.position = come_to 
	
	#mouse
	
	if Input.is_mouse_button_pressed( 1 ):
		
		if just_pressed:
			for area in get_overlapping_areas():
				if area.is_in_group("target"):
					area.destroy();
			just_pressed = false
		
	else:
		just_pressed = true