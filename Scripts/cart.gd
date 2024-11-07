extends Area2D
#cart sahnesi

@onready var sprite = $Sprite2D
@export var asset_name: String  # Kartın asset'ini tutar

#Tıklama eventini gerçekleştiren fonksiyon
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			if sprite.texture == load("res://SecretHitlerAsset/OyuncuRolleri/RollerLib.png"):
				print("Liberal kart tiklandi")
			if sprite.texture == load("res://SecretHitlerAsset/OyuncuRolleri/RollerFas.png"):
				print("Fasist kart tiklandi")
			if sprite.texture == load("res://SecretHitlerAsset/OyuncuRolleri/RollerHit.png"):
				print("Hitler kart tiklandi")

func _ready():
	# Önce sprite'ın yüklenmiş olduğundan emin olun
	if sprite == null:
		print("Sprite bulunamadı!")
		return

	# asset_name yolunun geçerli bir texture olup olmadığını kontrol edin
	var texture_path = "res://SecretHitlerAsset/" + asset_name
	var texture = load(texture_path)
	if texture:
		sprite.texture = texture  # Texture'yi TouchScreenButton'a ata
	else:
		print("Texture yüklenemedi veya dosya yolu yanlış:", texture_path)

func _rolKartiniAl(rol,oyuncu_id):
	#Kartları gizlemek için alttaki hala getir
	
	#if oyuncu_id == 0:
		#if rol == "liberal":
			#asset_name = "RollerLib.png"
		#elif rol == "fasist":
			#asset_name = "RollerFas.png"
		#elif rol == "hitler":
			#asset_name = "RollerHit.png"
	#else:
		#asset_name = "RollerArka.png"

	if rol == "liberal":
		asset_name = "OyuncuRolleri/RollerLib.png"
	elif rol == "fasist":
		asset_name = "OyuncuRolleri/RollerFas.png"
	elif rol == "hitler":
		asset_name = "OyuncuRolleri/RollerHit.png"

func _partiKartiniAl(rol,oyuncu_id):
	#Kartları gizlemek için alttaki hala getir

	#if oyuncu_id == 0:
		#if rol == "liberal":
			#asset_name = "PartiUyeligiLib.png"
		#else:
			#asset_name = "PartiUyeligiFas.png"
	#else:
		#asset_name = "PartiUyeligiArka.png"

	if rol == "liberal":
		asset_name = "OyuncuRolleri/PartiUyeligiLib.png"
	else:
		asset_name = "OyuncuRolleri/PartiUyeligiFas.png"

func _oylamaKartiEvetAl(oyuncu_id):
	#Kartları gizlemek için alttaki hala getir
	
	#if oyuncu_id == 0:
		#asset_name = "Oylar/OylarEvet.png"
	#else:
		#asset_name = "Oylar/OylarArka2.png"
	
	asset_name = "Oylar/OylarEvet.png"

func _oylamaKartiHayirAl(oyuncu_id):
	#Kartları gizlemek için alttaki hala getir
	
	#if oyuncu_id == 0:
		#asset_name = "Oylar/OylarHayir.png"
	#else:
		#asset_name = "Oylar/OylarArka2.png"
		
	asset_name = "Oylar/OylarHayir.png"
