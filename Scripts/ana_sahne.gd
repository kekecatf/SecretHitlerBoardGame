extends Node2D
# AnaSahne Scripti

@onready var GameModeNode = preload("res://Sceens/game_mode.tscn")  # GameMode sahnesini yükle
var GameMode = null  # GameMode referansı
var kart_konumlar = [Vector2(450, 550), Vector2(50, 250), Vector2(500, 50), Vector2(900, 300), Vector2(430,300)]  # Kartların konumları
var kart_rotations = [0,90,-180,-90,0]

func _ready():
	GameMode = GameModeNode.instantiate()  # GameMode sahnesinden bir örnek oluştur
	add_child(GameMode)  # GameMode'u sahneye ekle
	GameMode.oyuncuRollerini_ata()  # GameMode fonksiyonlarını çağır

	kartlari_olustur()  # Kartları oluştur

func kartlari_olustur():
	var oyuncular = GameMode.get_oyuncular()
	for i in range(len(oyuncular)):
		var rol = oyuncular[i]["rol"]
		kartlari_oyuncuya_goster(i, rol)

func kartlari_oyuncuya_goster(oyuncu_index, rol):
	var offset_x = 50  # Kartların yan yana dizilmesi için x eksenindeki kaydırma miktarı
	var base_position = kart_konumlar[oyuncu_index % len(kart_konumlar)]  # Oyuncu indexine göre konumu al
	var kart_rotasyonu = kart_rotations[oyuncu_index % len(kart_konumlar)]
	
	# Rol kartını oluştur
	var rol_karti = load("res://Sceens/card.tscn").instantiate()
	rol_karti.asset_name = _rolKartiniAl(rol)  # Card scriptindeki asset_name değişkenine değer ata
	rol_karti.position = base_position
	rol_karti.rotation = kart_rotasyonu
	add_child(rol_karti)

	# Parti üyeliği kartını oluştur
	var parti_karti = load("res://Sceens/card.tscn").instantiate()
	parti_karti.asset_name = _partiKartiniAl(rol)  # Card scriptindeki asset_name değişkenine değer ata
	parti_karti.position = base_position + Vector2(offset_x, 0)
	parti_karti.rotation = kart_rotasyonu
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
