extends Node2D

@onready var GameModeNode = preload("res://Sceens/game_mode.tscn")  # GameMode sahnesini yükle
var GameMode = null  # GameMode referansı

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
	var base_position = Vector2(500, 500)  # 1. oyuncu için kartların başlangıç konumu
	var offset_x = 120  # Kartların yan yana dizilmesi için x eksenindeki kaydırma miktarı
	
	# Rol kartını oluştur
	var rol_karti = load("res://Sceens/card.tscn").instantiate()
	var button_rol = rol_karti.get_node("TouchScreenButton")
	button_rol.texture_normal = load(_rolKartiniAl(rol))
	rol_karti.position = base_position
	add_child(rol_karti)

	# Parti üyeliği kartını oluştur
	var parti_karti = load("res://Sceens/card.tscn").instantiate()
	var button_parti = parti_karti.get_node("TouchScreenButton")
	button_parti.texture_normal = load(_partiKartiniAl(rol))
	parti_karti.position = base_position + Vector2(offset_x, 0)
	add_child(parti_karti)

	# Evet oylama kartını oluştur
	var evet_karti = load("res://Sceens/card.tscn").instantiate()
	var button_evet = evet_karti.get_node("TouchScreenButton")
	button_evet.texture_normal = load("res://Assets/SecretHitlerAsset/Oylar/Oylar.png")
	evet_karti.position = base_position + Vector2(offset_x * 2, 0)
	add_child(evet_karti)

	# Hayır oylama kartını oluştur
	var hayir_karti = load("res://Sceens/card.tscn").instantiate()
	var button_hayir = hayir_karti.get_node("TouchScreenButton")
	button_hayir.texture_normal = load("res://Assets/SecretHitlerAsset/Oylar/Oylar.png")
	hayir_karti.position = base_position + Vector2(offset_x * 3, 0)
	add_child(hayir_karti)

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
