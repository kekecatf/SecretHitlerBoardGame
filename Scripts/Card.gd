extends Node2D
#Card Scripti

@onready var sprite = $Sprite2D
@onready var timer = $TouchScreenButton/Timer
@export var asset_name: String = "Zarf/Zarf.jpg"

func _ready():
	var texture_path = "res://Assets/SecretHitlerAsset/" + asset_name
	sprite.texture = load(texture_path)
	pass 

#func _process(delta):
	#if Input.is_action_just_pressed("Up"):
		#timer.start()
		#position.y -= 50
	#pass
#
#func _on_timer_timeout():
	#position.y += 50
	#print("timer durdu")
