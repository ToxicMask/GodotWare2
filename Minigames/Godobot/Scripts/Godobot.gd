extends Node2D

signal clear

onready var target = preload("res://Minigames/Godobot/Scenes/Target.tscn")

func _ready():
	_build_body()
	self.connect("clear", get_parent(), "win")

func _build_body():
	
	var dif = 1
	
	for j in $Joints.get_children():
		var t = target.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
		j.add_child(t)

func _check():
	print("CHECKED")
	
	var count: int = 0
	
	for j in $Joints.get_children():
		count += j.get_child_count()
	
	if count == 0:
		emit_signal("clear")
	else:
		print("Targets left: "+str(count))