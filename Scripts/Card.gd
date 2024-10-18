extends Node2D
# Card Scripti

@onready var button = $TouchScreenButton # TouchScreenButton'u yakala
@export var asset_name: String  # Kartın asset'ini tutar

# Dikdörtgen sınırları
var rect_min = Vector2(350, 500)
var rect_max = Vector2(800, 630)

func _ready():
	var texture_path = "res://Assets/SecretHitlerAsset/" + asset_name
	var texture = load(texture_path)

	if texture:
		button.texture_normal = texture  # Texture'yi TouchScreenButton'a ata
	
