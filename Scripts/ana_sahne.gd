extends Node2D

@onready var GameModeNode = preload("res://Sceens/game_mode.tscn")  # GameMode sahnesini yükle
@onready var KartNode = preload("res://Sceens/kart.tscn")
var Kart = null
var GameMode = null  # GameMode referansı

var liberal_yasa:int
var fasist_yasa:int

var baskanlik:int
var eskiBaskanlik:int
var sansolyelik:int
var eskiSansolyelik:int
var Hitler:int 

func _ready():
	GameMode = GameModeNode.instantiate()  # GameMode sahnesinden bir örnek oluştur
	add_child(GameMode)  # GameMode'u sahneye ekle
	Kart = KartNode.instantiate()
	add_child(Kart)
	Kart.position = Vector2(500,500)
	Kart.scale = Vector2(0.13,0.13)
	GameMode.oyuncuRollerini_ata()
	Hitler = GameMode.hitler
	print("Hitler= ",GameMode.hitler + 1)
	
	randomize()  # Rastgele sayı üreteciyi başlat
	baskanlik = randi_range(0, GameMode.oyuncuSayisi -1)  # 1 ile 10 arasında rastgele bir sayı
	print("İlk Başkan = ",baskanlik)


func _process(delta):
	if (fasist_yasa >= 4 and sansolyelik == Hitler) or (fasist_yasa == 6):
		GameMode.fasistZaferi()
	elif (liberal_yasa == 6):
		GameMode.liberalZaferi()
