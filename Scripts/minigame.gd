extends Node2D

export(String) var NAME = "Template"

export(String) var INSTRUCTION = "DO IT!"

export(int) var DURATION = 5

export(bool) var TIMEOUT_WIN = false

export(bool) var USE_KEYBOARD = false

export(bool) var USE_MOUSE = true

onready var difficulty = global.difficulty
var timer

var _minigame_has_ended = false

signal minigame_end(cond)
signal timer_percentage(remaining)



func _on_minigame_end_timeout():
	if not _minigame_has_ended:
		_minigame_has_ended = true
		emit_signal("minigame_end",TIMEOUT_WIN)
	pass

func win():
	if not _minigame_has_ended:
		_minigame_has_ended = true
		emit_signal("minigame_end",true)
	pass

func lose():
	if not _minigame_has_ended:
		_minigame_has_ended = true
		emit_signal("minigame_end",false)
	pass

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_minigame_end_timeout")
	timer.set_one_shot(true)
	timer.name = "Minigame_Timer"
	add_child(timer)
	set_process(false)
	set_physics_process(false)

func timer_pause():
	timer.set_paused(true)

func timer_resume():
	timer.set_paused(false)

func minigame_start():
	timer.wait_time = DURATION
	set_process(true)
	timer.start()
	pass

func _process(delta):
	emit_signal("timer_percentage", 100*timer.get_time_left()/DURATION)
	pass