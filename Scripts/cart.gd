extends Node2D

@onready var sprite = $Sprite2D
@export var asset_name: String  # Kartın asset'ini tutar

func _ready():
	print("Calıstı")
	var texture_path = "res://Assets/SecretHitlerAsset/" + asset_name
	var texture = load(texture_path)
	
	if texture:
		sprite.texture = texture  # Texture'yi TouchScreenButton'a ata
