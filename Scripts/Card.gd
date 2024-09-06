extends Node2D
#Card.gd

@onready var button = $TouchScreenButton  # TouchScreenButton'u yakala
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
		button.texture_normal = texture  # Texture'yi TouchScreenButton'a ata
		_set_fixed_size(button)  # Boyutu ayarla

func _set_fixed_size(button: TouchScreenButton):
	# Texture'nin orijinal boyutunu al
	var texture_size = button.texture_normal.get_size()

	# Ölçekleme oranlarını hesapla
	var scale_x = target_width / texture_size.x
	var scale_y = target_height / texture_size.y

	## TouchScreenButton'ın ölçeğini ayarla
	#button.rect_scale = Vector2(scale_x, scale_y)

func _physics_process(delta):
	if Input.is_action_pressed("Up"):
		print("basildi")


