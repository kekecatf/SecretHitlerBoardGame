extends Node2D
#Card.gd

@onready var sprite = $Sprite2D
@onready var timer = $TouchScreenButton/Timer
@export var asset_name: String
var zarf = "Zarf/Zarf.jpg"
var rol = "OyuncuRolleri/RollerArka.png"

# Sabit boyutları belirleyin
@export var target_width: int = 100
@export var target_height: int = 150

func _ready():
	asset_name = zarf
	var texture_path = "res://Assets/SecretHitlerAsset/" + asset_name
	var texture = load(texture_path)
	
	if texture:
		sprite.texture = texture
		_set_fixed_size(sprite)
		
	# Sprite boyutlandırıldıktan sonra rotasyonu uygula
	sprite.rotation_degrees = rotation

func _set_fixed_size(sprite: Sprite2D):
	# Texture'nin orijinal boyutunu al
	var texture_size = sprite.texture.get_size()

	# Ölçekleme oranlarını hesapla
	var scale_x = target_width / texture_size.x
	var scale_y = target_height / texture_size.y

	# Sprite'in ölçeğini ayarla
	sprite.scale = Vector2(scale_x, scale_y)
