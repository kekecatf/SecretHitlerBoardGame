extends Node2D
# AnaSahne Scripti

@onready var GameModeNode = preload("res://Sceens/game_mode.tscn")  # GameMode sahnesini yükle
var GameMode = null  # GameMode referansı
var kart_konumlar = [Vector2(100,100), Vector2(300,100), Vector2(500,100), Vector2(700,100), Vector2(900,100), Vector2(100,300),Vector2(300,300), Vector2(500,300), Vector2(700,300), Vector2(900,300)]  # Kartların konumları
var kart_rotations = [0,0,0,0,0,0,0,0,0,0]

var zarf_asset = "Zarf/Zarf1.jpg"  # Zarf asseti

func _ready():
	GameMode = GameModeNode.instantiate()  # GameMode sahnesinden bir örnek oluştur
	add_child(GameMode)  # GameMode'u sahneye ekle
	GameMode.oyuncuRollerini_ata()  # GameMode fonksiyonlarını çağır

	zarf_olustur()  # Zarf oluşturma fonksiyonunu çağır

func zarf_olustur():
	var oyuncular = GameMode.get_oyuncular()
	for i in range(len(oyuncular)):
		var zarf = load("res://Sceens/zarf.tscn").instantiate()  # Zarf sahnesini oluştur
		zarf.position = kart_konumlar[i]  # Zarfı oyuncunun önüne koy
		zarf.asset_name = zarf_asset  # Zarfın görselini ayarla
		zarf.scale = Vector2(0.1,0.1)
		var touchscreen_button = zarf.get_node("TouchScreenButton")
		touchscreen_button.connect("pressed", Callable(self, "_on_zarf_tiklandi").bind(i))  # Zarf tıklanınca kartları gösterecek
		add_child(zarf)

# Zarf tıklandığında kartları gösterecek fonksiyon
func _on_zarf_tiklandi(oyuncu_index):
	# Zarfı kaldır
	for child in get_children():
		if child.position == kart_konumlar[oyuncu_index]:
			child.queue_free()  # Zarfı sahneden kaldır
	
	# Kartları göster
	var rol = GameMode.get_oyuncular()[oyuncu_index]["rol"]
	kartlari_oyuncuya_goster(oyuncu_index, rol)

# Kartları oluşturma fonksiyonu
func kartlari_oyuncuya_goster(oyuncu_index, rol):
	# Buradaki kart oluşturma kodları zaten mevcut
	var offset_x = 50
	var base_position = kart_konumlar[oyuncu_index % len(kart_konumlar)]
	var kart_rotasyonu = kart_rotations[oyuncu_index % len(kart_konumlar)]

	# Rol kartını oluştur
	var rol_karti = load("res://Sceens/card.tscn").instantiate()
	rol_karti.asset_name = _rolKartiniAl(rol)  # Her karta rolünü atıyoruz
	rol_karti.position = base_position
	rol_karti.rotation = kart_rotasyonu
	
	var touchscreen_buttonRol = rol_karti.get_node("TouchScreenButton")
	touchscreen_buttonRol.connect("pressed", Callable(self, "_on_card_tiklandi").bind(rol))
	add_child(rol_karti)

	# Parti üyeliği kartını oluştur
	var parti_karti = load("res://Sceens/card.tscn").instantiate()
	parti_karti.asset_name = _partiKartiniAl(rol)  # Card scriptindeki asset_name değişkenine değer ata
	parti_karti.position = base_position + Vector2(offset_x, 0)
	parti_karti.rotation = kart_rotasyonu
	
	var touchscreen_buttonParti = rol_karti.get_node("TouchScreenButton")
	touchscreen_buttonRol.connect("pressed", Callable(self, "_on_card_tiklandi").bind(parti_karti))
	add_child(parti_karti)
	
	# Evet oylama kartını oluştur
	var evet_karti = load("res://Sceens/card.tscn").instantiate()
	evet_karti.asset_name = "Oylar/OylarEvet.png"  # Evet kartı için doğru asset'i ata
	evet_karti.position = base_position + Vector2(offset_x * 2, 0)
	evet_karti.rotation = kart_rotasyonu
	add_child(evet_karti)
	
	# Hayır oylama kartını oluştur
	var hayir_karti = load("res://Sceens/card.tscn").instantiate()
	hayir_karti.asset_name = "Oylar/OylarHayir.png"  # Hayır kartı için doğru asset'i ata
	hayir_karti.position = base_position + Vector2(offset_x * 3, 0)
	hayir_karti.rotation = kart_rotasyonu
	add_child(hayir_karti)

func _on_card_tiklandi(rol):
	print(rol + " kartı tıklandı!")

func _rolKartiniAl(rol):
	if rol == "liberal":
		return "OyuncuRolleri/RollerLib.png"
	elif rol == "fasist":
		return "OyuncuRolleri/RollerFas.png"
	elif rol == "hitler":
		return "OyuncuRolleri/RollerHit.png"

func _partiKartiniAl(rol):
	if rol == "liberal":
		return "OyuncuRolleri/PartiUyeligiLib.png"
	else:
		return "OyuncuRolleri/PartiUyeligiFas.png"
