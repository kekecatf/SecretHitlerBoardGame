extends Node2D
# Zarf Scripti

@onready var button = $TouchScreenButton # TouchScreenButton'u yakala
@export var asset_name: String  # Zarfin asset'ini tutar

func _ready():
	var texture_path = "res://Assets/SecretHitlerAsset/" + asset_name
	var texture = load(texture_path)

	if texture:
		button.texture_normal = texture 
