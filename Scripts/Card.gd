extends Node2D
#Card Scripti

@onready var button = $TouchScreenButton  # TouchScreenButton'u yakala
@export var asset_name: String

var zarf = "Zarf/Zarf1.jpg"

func _ready():
	var texture_path = "res://Assets/SecretHitlerAsset/" + asset_name
	var texture = load(texture_path)

	if texture:
		button.texture_normal = texture  # Texture'yi TouchScreenButton'a ata
	
