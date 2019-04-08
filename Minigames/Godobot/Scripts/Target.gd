extends Area2D

var body_parts: Dictionary = {
	"example": {"offset": Vector2(0,0), "target": Vector2(0,0), "scale":Vector2(0,0),},
	"center": {"offset": Vector2(0,0), "target": Vector2(0,0), "scale": Vector2(1,1),},
	"l_arm": {"offset": Vector2(32,32), "target": Vector2(32,128), "scale":Vector2(1,2.5),},
	"r_arm": {"offset": Vector2(-32,32), "target": Vector2(-32,128), "scale":Vector2(1,2.5),},
	"head": {"offset": Vector2(0,-32), "target": Vector2(0,-48), "scale":Vector2(1.5,1.5),},
}



func _ready():
	self.connect("tree_exited",get_parent().get_parent().get_parent(),"_check")

func build_part(part: String, weak: bool):
	var pt : Dictionary = body_parts[part]
	
	for key in pt.keys():
		if key == "target":
			$WeakSpot.position = pt[key]
			
		else:
			$Part.set(key, pt[key])
		
		if not weak:
			$WeakSpot.disabled = true
			$WeakSpot.hide()
		
		else:
			self.add_to_group("target")

func destroy():
	queue_free()