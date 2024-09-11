extends Node2D

# GameMode sahnesine referans @onready ile tanımlanıyor
@onready var game_mode = load("res://Sceens/game_mode.tscn").instantiate()

# Kartların pozisyonları (oyuncu sayısına göre dinamik olabilir)
var kart_pozisyonlari = [Vector2(480, 480), Vector2(112, 328), Vector2(480, 128), Vector2(1000, 312)]

# Kartların boyutları
var kart_boyutu = Vector2(100, 150)  # Tüm kartlar için ortak boyut

# Oyuncu bilgileri
var oyuncular = []

func _ready():
	# GameMode sahnesini AnaSahne'ye ekleyin
	add_child(game_mode)

	# Rolleri belirleyip kartları atayın
	oyuncuRollerini_ata()

func oyuncuRollerini_ata():
	# GameMode içindeki oyuncu rollerini alıyoruz
	var oyuncuRolleri = game_mode.oyuncuRolleri

	# Oyunculara kartların atanması
	for i in range(oyuncuRolleri.size()):
		var rol = oyuncuRolleri[i]

		# Oyuncuları dinamik olarak oluşturun ve rolleri atayın
		var oyuncu_scene = load("res://Sceens/oyuncu.tscn").instantiate()
		add_child(oyuncu_scene)

		var parti_bilgisi = "Liberal Parti" if rol == "liberal" else "Fasist Parti"
		oyuncu_scene.bilgileri_ayarla(rol, parti_bilgisi)
		oyuncular.append(oyuncu_scene)
		print("Oyuncu ", i + 1, " rolü: ", rol, ", parti üyeliği: ", parti_bilgisi)

		# Oyuncunun önüne kartları yerleştir
		kartlari_olustur(i, rol)


func _rolKartiniAl(rol):
	if rol == "liberal":
		return "res://Assets/SecretHitlerAsset/OyuncuRolleri/RollerLib.png"
	elif rol == "fasist":
		return "res://Assets/SecretHitlerAsset/OyuncuRolleri/RollerFas.png"
	elif rol == "hitler":
		return "res://Assets/SecretHitlerAsset/OyuncuRolleri/RollerHit.png"

func _partiKartiniAl(rol):
	if rol == "liberal":
		return "res://Assets/SecretHitlerAsset/OyuncuRolleri/PartiUyeligiLib.png"
	else:
		return "res://Assets/SecretHitlerAsset/OyuncuRolleri/PartiUyeligiFas.png"

func kartlari_olustur(oyuncu_index, rol):
	# Kartların pozisyonunu al
	var pozisyon = kart_pozisyonlari[oyuncu_index]

	# Rol kartını oluştur ve yerleştir
	var rol_karti = load("res://Sceens/card.tscn").instantiate()
	rol_karti.position = pozisyon

	# Kartın `TouchScreenButton` bileşenine erişip texture ayarlayalım
	var button = rol_karti.get_node("TouchScreenButton")
	button.texture_normal = load(_rolKartiniAl(rol))
	
	# Kartın boyutlandırmasını ayarlayalım
	_set_kart_boyutu(button)

	add_child(rol_karti)

	# Parti üyeliği kartını oluştur ve yerleştir
	var parti_karti = load("res://Sceens/card.tscn").instantiate()
	parti_karti.position = pozisyon + Vector2(120, 0)  # Yana kaydırma
	var button_parti = parti_karti.get_node("TouchScreenButton")
	button_parti.texture_normal = load(_partiKartiniAl(rol))
	
	_set_kart_boyutu(button_parti)

	add_child(parti_karti)

	# Evet oylama kartı
	var evet_karti = load("res://Sceens/card.tscn").instantiate()
	evet_karti.position = pozisyon + Vector2(240, 0)  # Yana kaydırma
	var button_evet = evet_karti.get_node("TouchScreenButton")
	button_evet.texture_normal = load("res://Assets/SecretHitlerAsset/Oylar/Oylar.png")
	
	_set_kart_boyutu(button_evet)

	add_child(evet_karti)

	# Hayır oylama kartı
	var hayir_karti = load("res://Sceens/card.tscn").instantiate()
	hayir_karti.position = pozisyon + Vector2(360, 0)  # Yana kaydırma
	var button_hayir = hayir_karti.get_node("TouchScreenButton")
	button_hayir.texture_normal = load("res://Assets/SecretHitlerAsset/Oylar/Oylar.png")
	
	_set_kart_boyutu(button_hayir)

	add_child(hayir_karti)

# Kart boyutlandırma fonksiyonu
func _set_kart_boyutu(button: TouchScreenButton):
	# Boyutlandırmayı düğmenin `rect_min_size` özelliği ile yap
	button.rect_min_size = Vector2(100, 150)  # Sabit bir boyut örneği
