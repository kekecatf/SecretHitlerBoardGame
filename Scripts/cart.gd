extends Node2D
#cart sahnesi

@onready var sprite = $Sprite2D
@export var asset_name: String  # Kartın asset'ini tutar

func _ready():
	# Önce sprite'ın yüklenmiş olduğundan emin olun
	if sprite == null:
		print("Sprite bulunamadı!")
		return

	# asset_name yolunun geçerli bir texture olup olmadığını kontrol edin
	var texture_path = "res://SecretHitlerAsset/OyuncuRolleri/" + asset_name
	var texture = load(texture_path)

	if texture:
		sprite.texture = texture  # Texture'yi TouchScreenButton'a ata
	else:
		print("Texture yüklenemedi veya dosya yolu yanlış:", texture_path)


func set_role(rol,part):
	if rol == "liberal":
		asset_name ="RollerLib.png"
	elif rol == "fasist":
		asset_name = "RollerFas.png"
	elif rol == "hitler":
		asset_name ="RollerHit.png"
	else:
		print("Bilinmeyen rol:", rol)
	
	if part == "liberal uyelik":
		asset_name ="PartiUyeligiLib.png"
	elif part == "fasist uyelik":
		asset_name = "PartiUyeligiFas.png"
	elif part == "fasist uyelik":
		asset_name ="PartiUyeligiFas.png"
	else:
		print("Bilinmeyen rol:", part)
