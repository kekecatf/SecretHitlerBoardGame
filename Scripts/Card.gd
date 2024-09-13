extends Node2D

@onready var button = $TouchScreenButton  # TouchScreenButton'u yakala
@export var asset_name: String = "Zarf/Zarf.jpg"

func _ready():
	var texture_path = "res://Assets/SecretHitlerAsset/" + asset_name
	var texture = load(texture_path)

	if texture:
		button.texture_normal = texture  # Texture'yi TouchScreenButton'a ata
