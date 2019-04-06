extends Area2D

func _ready():
	self.connect("tree_exited",get_parent().get_parent().get_parent(),"_check")

func destroy():
	queue_free()