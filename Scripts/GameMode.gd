extends Node2D
#GameMode.gd

var oyuncuSayisi = 5  # Test için başlangıç değeri, bunu dinamik olarak ayarlayabilirsiniz.
var rng = RandomNumberGenerator.new()
var oyuncuRolleri = []
var oyuncuKartlar = []

# Oyuncuların bilgilerini tutmak için bir dizi
var oyuncular = []

func _ready():
	rng.randomize()

	# Oyuncu sayısına göre rollerin sayısını ayarlayın
	if oyuncuSayisi == 5:
		oyuncuRolleri = ["liberal", "liberal", "liberal", "fasist", "hitler"]
	# (Diğer oyuncu sayıları için aynı kod)
	
	# Rolleri karıştırın
	oyuncuRolleri.shuffle()

	# Oyuncuları dinamik olarak oluştur ve AnaSahne'ye ekle
	for i in range(oyuncuSayisi):
		var oyuncu_scene = load("res://Sceens/oyuncu.tscn").instantiate()
		add_child(oyuncu_scene)
		
		var rol_bilgisi = oyuncuRolleri[i]
		var parti_bilgisi = "Liberal Parti" if rol_bilgisi == "liberal" else "Fasist Parti"
		
		# Oyuncunun bilgilerini ayarlayın
		oyuncu_scene.bilgileri_ayarla(rol_bilgisi, parti_bilgisi)
		
		# Kartları oyuncunun önüne yerleştir
		_kartlari_olustur(oyuncu_scene, rol_bilgisi, parti_bilgisi)

		# Oyuncuyu listeye ekleyin
		oyuncular.append(oyuncu_scene)
		
		print("Oyuncu ", i + 1, " rolü: ", rol_bilgisi, ", parti üyeliği: ", parti_bilgisi)

# Kartları oluşturma fonksiyonu
func _kartlari_olustur(oyuncu, rol_bilgisi, parti_bilgisi):
	# Kartlar için ölçek (boyut) belirleyin
	var kart_olcegi = Vector2(0.1, 0.1)  # Kartları %50 boyutuna küçülttük
	
	# Rol ve parti üyeliği kartları için asset yolları
	var rol_kart_yolu = ""
	var parti_kart_yolu = ""

	if rol_bilgisi == "liberal":
		rol_kart_yolu = "res://Assets/SecretHitlerAsset/OyuncuRolleri/RollerLib.png"
		parti_kart_yolu = "res://Assets/SecretHitlerAsset/OyuncuRolleri/PartiUyeligiLib.png"
	elif rol_bilgisi == "fasist":
		rol_kart_yolu = "res://Assets/SecretHitlerAsset/OyuncuRolleri/RollerFas.png"
		parti_kart_yolu = "res://Assets/SecretHitlerAsset/OyuncuRolleri/PartiUyeligiFas.png"
	elif rol_bilgisi == "hitler":
		rol_kart_yolu = "res://Assets/SecretHitlerAsset/OyuncuRolleri/RollerHit.png"
		parti_kart_yolu = "res://Assets/SecretHitlerAsset/OyuncuRolleri/PartiUyeligiFas.png"

	# Rol kartı için Sprite oluştur
	var rol_kart = Sprite2D.new()
	rol_kart.texture = load(rol_kart_yolu)
	rol_kart.position = oyuncu.position + Vector2(50, 50)
	rol_kart.scale = kart_olcegi  # Boyutlandırma

	# Parti üyeliği kartı için Sprite oluştur
	var parti_karti = Sprite2D.new()
	parti_karti.texture = load(parti_kart_yolu)
	parti_karti.position = oyuncu.position + Vector2(50, 150)
	parti_karti.scale = kart_olcegi  # Boyutlandırma

	# Evet oylama kartı için Sprite oluştur
	var evet_karti = Sprite2D.new()
	evet_karti.texture = load("res://Assets/SecretHitlerAsset/Oylar/OyArka.png")
	evet_karti.position = oyuncu.position + Vector2(50, 250)
	evet_karti.scale = kart_olcegi  # Boyutlandırma

	# Hayır oylama kartı için Sprite oluştur
	var hayir_karti = Sprite2D.new()
	hayir_karti.texture = load("res://Assets/SecretHitlerAsset/Oylar/OyArka.png")
	hayir_karti.position = oyuncu.position + Vector2(50, 350)
	hayir_karti.scale = kart_olcegi  # Boyutlandırma

	# Kartları sahneye ekle
	add_child(rol_kart)
	add_child(parti_karti)
	add_child(evet_karti)
	add_child(hayir_karti)


