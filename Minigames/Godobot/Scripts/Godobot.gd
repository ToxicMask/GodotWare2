extends Node2D

signal clear

func _ready():
	self.connect("clear", get_parent(), "win")


func _check():
	var count: int = 0
	for T in get_tree().get_nodes_in_group("target"):
		count +=1
	
	if count == 0:
		emit_signal("clear")
	else:
		print("Targets left: "+str(count))