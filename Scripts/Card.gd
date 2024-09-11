extends Node2D

@onready var button = $TouchScreenButton  # TouchScreenButton'u yakala
@export var asset_name: String = "Zarf/Zarf.jpg"

@export var target_width: int = 100
@export var target_height: int = 150

func _ready():
	var texture_path = "res://Assets/SecretHitlerAsset/" + asset_name
	var texture = load(texture_path)

	if texture:
		button.texture_normal = texture  # Texture'yi TouchScreenButton'a ata
		_set_fixed_size(button)  # Boyutu ayarla

func _set_fixed_size(button: TouchScreenButton):
	# Texture'nin orijinal boyutunu al
	var texture_size = button.texture_normal.get_size()

	# Ölçekleme oranlarını hesapla
	var scale_x = target_width / texture_size.x
	var scale_y = target_height / texture_size.y

	# Boyutlandırmayı düğmenin `rect_min_size` özelliği ile yap
	button.rect_min_size = Vector2(target_width, target_height)
