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


func _rolKartiniAl(rol):
	#if oyuncu_index==0:
		#if rol == "liberal":
			#return "OyuncuRolleri/RollerLib.png"
		#elif rol == "fasist":
			#return "OyuncuRolleri/RollerFas.png"
		#elif rol == "hitler":
			#return "OyuncuRolleri/RollerHit.png"
	#else:
		#if rol == "liberal":
			#return "OyuncuRolleri/RollerArka.png"
		#elif rol == "fasist":
			#return "OyuncuRolleri/RollerArka.png"
		#elif rol == "hitler":
			#return "OyuncuRolleri/RollerArka.png"
	if rol == "liberal":
		asset_name = "RollerLib.png"
	elif rol == "fasist":
		asset_name = "RollerFas.png"
	elif rol == "hitler":
		asset_name = "RollerHit.png"

func _partiKartiniAl(rol):
	#if oyuncu_index == 0:
		#if rol == "liberal":
			#return "OyuncuRolleri/PartiUyeligiLib.png"
		#else:
			#return "OyuncuRolleri/PartiUyeligiFas.png"
	#else:
		#if rol == "liberal":
			#return "OyuncuRolleri/PartiUyeligiArka.png"
		#else:
			#return "OyuncuRolleri/PartiUyeligiArka.png"
	if rol == "liberal":
		asset_name = "PartiUyeligiLib.png"
	else:
		asset_name = "PartiUyeligiFas.png"
