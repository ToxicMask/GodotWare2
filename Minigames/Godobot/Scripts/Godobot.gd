extends Node2D

signal clear

onready var target = preload("res://Minigames/Godobot/Scenes/Target.tscn")

func _ready():
	_build_body(global.difficulty,$Joints.get_child_count())
	self.connect("clear", get_parent(), "win")

func _build_body(diff:int, max_weak:int):
	
	var weak_parts=[]
	
	for p in range(diff):
		weak_parts.append(true)
	
	for m in range(diff, max_weak):
		weak_parts.append(false)
	
	randomize()
	weak_parts.shuffle()
	
	var w_pos =0
	
	for j in $Joints.get_children():
		if weak_parts[w_pos]:
			var t = target.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
			j.add_child(t)
		w_pos +=1

func _check():
	
	var count: int = 0
	
	for j in $Joints.get_children():
		count += j.get_child_count()
	
	if count == 0:
		emit_signal("clear")
	else:
		print("Targets left: "+str(count))