extends Node2D

@onready var dokunmatik = $TouchScreenButton
@onready var timer = $TouchScreenButton/Timer
@export var asset_name: String = "3.1.png"

func _ready():
	var texture_path = "res://Assets/Cards/" + asset_name
	dokunmatik.texture_normal = load(texture_path)
	pass 

func _process(delta):
	if Input.is_action_just_pressed("Up"):
		timer.start()
		position.y -= 50
	pass

func _on_timer_timeout():
	position.y += 50
	print("timer durdu")
